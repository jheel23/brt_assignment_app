import 'dart:async';
import 'dart:convert';
import 'package:brtassignment/core/local/secure_storage_service.dart';
import 'package:brtassignment/data/repository/product_repo.dart';
import 'package:brtassignment/domain/entities/product_entity.dart';
import 'package:brtassignment/providers/products/state/product_state.dart';
import 'package:brtassignment/service_locator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsNotifier extends Notifier<ProductState> {
  final Set<int> _wishlistIds = {};
  List<String> _categories = [];
  String? _selectedCategory;
  String _searchQuery = '';
  final int _limit = 20;
  int _skip = 0;
  int _total = 0;
  bool _isOffline = false;
  Timer? _searchDebounceTimer;

  @override
  ProductState build() {
    Future.microtask(() async {
      await loadWishlist();
      await loadCategories();
      await loadProducts(refresh: true);
    });
    return const ProductState.initial();
  }

  Future<void> loadWishlist() async {
    try {
      final storage = sl<SecureStorageService>();
      final cachedWishlist = await storage.getString('wishlist_ids');
      if (cachedWishlist != null) {
        final List<dynamic> decoded = jsonDecode(cachedWishlist);
        _wishlistIds.clear();
        _wishlistIds.addAll(decoded.cast<int>());
        _updateLoadedState();
      }
    } catch (_) {}
  }

  Future<void> toggleWishlist(int productId) async {
    if (_wishlistIds.contains(productId)) {
      _wishlistIds.remove(productId);
    } else {
      _wishlistIds.add(productId);
    }
    _updateLoadedState();

    try {
      final storage = sl<SecureStorageService>();
      await storage.setString(
        'wishlist_ids',
        jsonEncode(_wishlistIds.toList()),
      );
    } catch (_) {}
  }

  Future<void> loadCategories() async {
    final repo = sl<ProductRepo>();
    final result = await repo.getCategories();
    result.fold(
      (failure) {
        _isOffline = repo.isOffline;
        state = ProductState.error(failure.message);
      },
      (cats) {
        _categories = cats;
        _isOffline = repo.isOffline;
        _updateLoadedState();
      },
    );
  }

  Future<void> selectCategory(String? category) async {
    if (_selectedCategory == category) return;
    _selectedCategory = category;
    _skip = 0;
    await loadProducts(refresh: true);
  }

  void setSearchQuery(String query) {
    if (_searchQuery == query) return;
    _searchQuery = query;
    _skip = 0;
    _updateLoadedState();
    _searchDebounceTimer?.cancel();
    _searchDebounceTimer = Timer(const Duration(milliseconds: 1000), () {
      loadProducts(refresh: true);
    });
  }

  Future<void> loadProducts({bool refresh = false}) async {
    final bool currentlyLoading = state.maybeWhen(
      loading: () => true,
      loaded: (_, _, _, _, _, _, _, isLoadingMore, _, _) => isLoadingMore,
      orElse: () => false,
    );
    if (currentlyLoading) return;

    List<ProductEntity> currentProducts = [];
    state.maybeWhen(
      loaded: (products, _, _, _, _, _, _, _, _, _) {
        currentProducts = products;
      },
      orElse: () {},
    );

    if (refresh) {
      state = const ProductState.loading();
      _skip = 0;
    } else {
      state = ProductState.loaded(
        products: currentProducts,
        categories: _categories,
        selectedCategory: _selectedCategory,
        searchQuery: _searchQuery,
        limit: _limit,
        skip: _skip,
        total: _total,
        isLoadingMore: true,
        isOffline: _isOffline,
        wishlistIds: Set<int>.from(_wishlistIds),
      );
    }

    final repo = sl<ProductRepo>();
    final result = await repo.getProducts(
      search: _searchQuery,
      category: _selectedCategory,
      limit: _limit,
      skip: _skip,
    );

    result.fold(
      (failure) {
        _isOffline = repo.isOffline;
        if (refresh) {
          state = ProductState.error(failure.message);
        } else {
          state = ProductState.loaded(
            products: currentProducts,
            categories: _categories,
            selectedCategory: _selectedCategory,
            searchQuery: _searchQuery,
            limit: _limit,
            skip: _skip,
            total: _total,
            isLoadingMore: false,
            isOffline: _isOffline,
            wishlistIds: Set<int>.from(_wishlistIds),
          );
        }
      },
      (parentEntity) {
        _isOffline = repo.isOffline;
        final newProducts = refresh
            ? parentEntity.products
            : [...currentProducts, ...parentEntity.products];
        _skip = _skip + parentEntity.products.length;
        _total = parentEntity.total;

        state = ProductState.loaded(
          products: newProducts,
          categories: _categories,
          selectedCategory: _selectedCategory,
          searchQuery: _searchQuery,
          limit: _limit,
          skip: _skip,
          total: _total,
          isLoadingMore: false,
          isOffline: _isOffline,
          wishlistIds: Set<int>.from(_wishlistIds),
        );
      },
    );
  }

  void _updateLoadedState() {
    state.maybeWhen(
      loaded: (products, _, _, _, _, _, _, isLoadingMore, _, _) {
        state = ProductState.loaded(
          products: products,
          categories: _categories,
          selectedCategory: _selectedCategory,
          searchQuery: _searchQuery,
          limit: _limit,
          skip: _skip,
          total: _total,
          isLoadingMore: isLoadingMore,
          isOffline: _isOffline,
          wishlistIds: Set<int>.from(_wishlistIds),
        );
      },
      orElse: () {},
    );
  }

  Future<void> retry() async {
    await loadCategories();
    await loadProducts(refresh: true);
  }
}

final productsProvider = NotifierProvider<ProductsNotifier, ProductState>(() {
  return sl<ProductsNotifier>();
});
