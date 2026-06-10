import 'dart:convert';
import 'package:brtassignment/core/failures.dart';
import 'package:brtassignment/core/local/secure_storage_service.dart';
import 'package:brtassignment/data/models/product/product_model.dart';
import 'package:brtassignment/data/source/product_api_service.dart';
import 'package:brtassignment/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProductRepo {
  bool get isOffline;
  Future<Either<Failure, ParentProductEntity>> getProducts({
    String? search,
    String? category,
    int? limit,
    int? skip,
  });
  Future<Either<Failure, List<String>>> getCategories();
}

class ProductRepoImpl implements ProductRepo {
  final ProductApiService productApiService;
  final SecureStorageService storageService;
  bool _isOffline = false;

  ProductRepoImpl({
    required this.productApiService,
    required this.storageService,
  });

  @override
  bool get isOffline => _isOffline;

  @override
  Future<Either<Failure, ParentProductEntity>> getProducts({
    String? search,
    String? category,
    int? limit,
    int? skip,
  }) async {
    final result = await productApiService.getProducts(
      search: search,
      category: category,
      limit: limit,
      skip: skip,
    );

    return result.fold(
      (failure) async {
        if ((skip == 0 || skip == null) &&
            (search == null || search.isEmpty) &&
            (category == null || category.isEmpty)) {
          try {
            final cachedData = await storageService.getListMap(
              'cached_products',
            );
            if (cachedData.isNotEmpty) {
              _isOffline = true;
              final products = cachedData
                  .map((e) => ProductModel.fromJson(e))
                  .toList();
              final parentModel = ParentProductModel(
                products: products,
                total: products.length,
                skip: 0,
                limit: products.length,
              );
              return Right(parentModel.toEntity());
            }
          } catch (_) {}
        }
        _isOffline = true;
        return Left(failure);
      },
      (data) async {
        _isOffline = false;
        final parsed = ParentProductModel.fromJson(data);
        if ((skip == 0 || skip == null) &&
            (search == null || search.isEmpty) &&
            (category == null || category.isEmpty)) {
          try {
            final listMap = parsed.products?.map((e) => e.toJson()).toList();
            await storageService.setListMap('cached_products', listMap ?? []);
          } catch (_) {}
        }
        return Right(parsed.toEntity());
      },
    );
  }

  @override
  Future<Either<Failure, List<String>>> getCategories() async {
    final result = await productApiService.getCategories();
    return result.fold(
      (failure) async {
        try {
          final cached = await storageService.getString('cached_categories');
          if (cached != null) {
            _isOffline = true;
            final List<dynamic> decoded = jsonDecode(cached);
            return Right(decoded.cast<String>());
          }
        } catch (_) {}
        _isOffline = true;
        return Left(failure);
      },
      (data) async {
        _isOffline = false;
        final List<String> categories = [];
        if (data is List) {
          for (var item in data) {
            if (item is String) {
              categories.add(item);
            } else if (item is Map) {
              categories.add(item['slug'] ?? item['name'] ?? '');
            }
          }
        }
        try {
          await storageService.setString(
            'cached_categories',
            jsonEncode(categories),
          );
        } catch (_) {}
        return Right(categories);
      },
    );
  }
}
