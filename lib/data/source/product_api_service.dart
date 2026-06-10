import 'package:brtassignment/core/constants/api_endpoints.dart';
import 'package:brtassignment/core/failures.dart';
import 'package:brtassignment/core/network/dio_client.dart';
import 'package:dartz/dartz.dart';

abstract class ProductApiService {
  Future<Either<Failure, dynamic>> getProducts({
    String? search,
    String? category,
    int? limit,
    int? skip,
  });
  Future<Either<Failure, dynamic>> getCategories();
}

class ProductApiServiceImpl implements ProductApiService {
  final DioClient _dioClient;
  ProductApiServiceImpl(this._dioClient);

  @override
  Future<Either<Failure, dynamic>> getProducts({
    String? search,
    String? category,
    int? limit,
    int? skip,
  }) async {
    try {
      String endpoint = ApiEndpoints.products;
      final Map<String, dynamic> params = {};
      if (limit != null) params['limit'] = limit;
      if (skip != null) params['skip'] = skip;

      if (search != null && search.isNotEmpty) {
        endpoint = ApiEndpoints.searchProducts;
        params['q'] = search;
      } else if (category != null && category.isNotEmpty) {
        endpoint = ApiEndpoints.categoryProducts(category);
      }

      final response = await _dioClient.getRequest(
        endpoint,
        queryParameters: params,
      );
      return Right(response.data);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> getCategories() async {
    try {
      final response = await _dioClient.getRequest(ApiEndpoints.categories);
      return Right(response.data);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
