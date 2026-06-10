import 'package:brtassignment/config/theme/app_theme.dart';
import 'package:brtassignment/domain/entities/product_entity.dart';
import 'package:brtassignment/providers/products/products_provider.dart';
import 'package:brtassignment/providers/products/state/product_state.dart';
import 'package:brtassignment/views/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _showOnlyWishlist = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(productsProvider);
    final notifier = ref.read(productsProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('JStore'),
        actions: [
          IconButton(
            icon: Icon(
              _showOnlyWishlist ? Icons.favorite : Icons.favorite_border,
              color: _showOnlyWishlist
                  ? AppTheme.errorColor
                  : AppTheme.textPrimary,
            ),
            tooltip: 'Wishlist',
            onPressed: () {
              setState(() {
                _showOnlyWishlist = !_showOnlyWishlist;
              });
            },
          ),
        ],
      ),
      body: state.when(
        initial: () => const Center(
          child: CircularProgressIndicator(color: AppTheme.primaryColor),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppTheme.primaryColor),
        ),
        error: (message) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.cloud_off_rounded,
                  size: 64,
                  color: AppTheme.textSecondary,
                ),
                const SizedBox(height: 16),
                Text(
                  'Something went wrong',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  message,
                  style: const TextStyle(color: AppTheme.textSecondary),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => notifier.retry(),
                  child: const Text('Try Again'),
                ),
              ],
            ),
          ),
        ),
        loaded:
            (
              products,
              categories,
              selectedCategory,
              searchQuery,
              limit,
              skip,
              total,
              isLoadingMore,
              isOffline,
              wishlistIds,
            ) {
              final displayedProducts = _showOnlyWishlist
                  ? products.where((p) => wishlistIds.contains(p.id)).toList()
                  : products;

              return Column(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: isOffline ? 40 : 0,
                    width: double.infinity,
                    color: AppTheme.errorColor,
                    alignment: Alignment.center,
                    child: isOffline
                        ? const SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.wifi_off_rounded,
                                  color: Colors.white,
                                  size: 16,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'No Internet Connection!',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),

                  if (!_showOnlyWishlist)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Search products...',
                          prefixIcon: const Icon(
                            Icons.search,
                            color: AppTheme.textSecondary,
                          ),
                          suffixIcon: _searchController.text.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(
                                    Icons.clear,
                                    color: AppTheme.textSecondary,
                                  ),
                                  onPressed: () {
                                    _searchController.clear();
                                    notifier.setSearchQuery('');
                                  },
                                )
                              : null,
                        ),
                        onChanged: (val) {
                          notifier.setSearchQuery(val);
                          setState(() {});
                        },
                      ),
                    ),

                  if (!_showOnlyWishlist)
                    Container(
                      height: 48,
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 6,
                        ),
                        itemCount: categories.length + 1,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 8),
                        itemBuilder: (context, index) {
                          final isAll = index == 0;
                          final categoryName = isAll
                              ? null
                              : categories[index - 1];
                          final isSelected = isAll
                              ? selectedCategory == null
                              : selectedCategory == categoryName;

                          return GestureDetector(
                            onTap: () {
                              notifier.selectCategory(categoryName);
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppTheme.primaryColor
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: isSelected
                                      ? AppTheme.primaryColor
                                      : AppTheme.borderColor,
                                ),
                              ),
                              child: Text(
                                isAll
                                    ? 'All'
                                    : categoryName!
                                          .replaceAll('-', ' ')
                                          .toUpperCase(),
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: isSelected
                                      ? Colors.white
                                      : AppTheme.textSecondary,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                  Expanded(
                    child: _buildGridContent(
                      displayedProducts,
                      isLoadingMore,
                      wishlistIds,
                      notifier,
                    ),
                  ),
                ],
              );
            },
      ),
    );
  }

  Widget _buildGridContent(
    List<ProductEntity> displayedProducts,
    bool isLoadingMore,
    Set<int> wishlistIds,
    ProductsNotifier notifier,
  ) {
    if (displayedProducts.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.hourglass_empty_rounded,
              size: 64,
              color: AppTheme.textSecondary,
            ),
            const SizedBox(height: 16),
            Text(
              _showOnlyWishlist
                  ? 'Your wishlist is empty'
                  : 'No products found',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              _showOnlyWishlist
                  ? 'Add items to your wishlist to see them here.'
                  : 'Try searching or filtering for something else.',
              style: const TextStyle(color: AppTheme.textSecondary),
            ),
          ],
        ),
      );
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (_showOnlyWishlist) return false;

        if (scrollInfo.metrics.pixels >=
            scrollInfo.metrics.maxScrollExtent * 0.85) {
          notifier.loadProducts();
        }
        return true;
      },
      child: RefreshIndicator(
        onRefresh: () => notifier.loadProducts(refresh: true),
        color: AppTheme.primaryColor,
        child: GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.65,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: displayedProducts.length + (isLoadingMore ? 2 : 0),
          itemBuilder: (context, index) {
            if (index >= displayedProducts.length) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(
                    color: AppTheme.primaryColor,
                  ),
                ),
              );
            }

            final product = displayedProducts[index];
            final isWishlisted = wishlistIds.contains(product.id);

            return ProductCard(
              product: product,
              isWishlisted: isWishlisted,
              onWishlistTap: () => notifier.toggleWishlist(product.id),
            );
          },
        ),
      ),
    );
  }
}
