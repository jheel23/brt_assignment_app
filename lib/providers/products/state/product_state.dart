import 'package:brtassignment/domain/entities/product_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_state.freezed.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = _ProductStateInitial;
  const factory ProductState.loading() = _ProductStateLoading;
  const factory ProductState.loaded({
    required List<ProductEntity> products,
    required List<String> categories,
    required String? selectedCategory,
    required String searchQuery,
    required int limit,
    required int skip,
    required int total,
    required bool isLoadingMore,
    required bool isOffline,
    required Set<int> wishlistIds,
  }) = _ProductStateLoaded;
  const factory ProductState.error(String message) = _ProductStateError;
}
