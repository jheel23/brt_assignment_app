import 'package:brtassignment/domain/entities/product_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
abstract class ParentProductModel with _$ParentProductModel {
  const factory ParentProductModel({
    required List<ProductModel>? products,
    required int? total,
    required int? skip,
    required int? limit,
  }) = _ParentProductModel;

  factory ParentProductModel.fromJson(Map<String, dynamic> json) =>
      _$ParentProductModelFromJson(json);
}

@freezed
abstract class ProductModel with _$ProductModel {
  const factory ProductModel({
    required int? id,
    required String? title,
    required String? description,
    required String? category,
    required double? price,
    required double? discountPercentage,
    required double? rating,
    required int? stock,
    required List<String>? tags,
    required String? brand,
    required String? warrantyInformation,
    required String? shippingInformation,
    required String? availabilityStatus,
    required List<ReviewModel>? reviews,
    required String? returnPolicy,
    required int? minimumOrderQuantity,
    required List<String>? images,
    required String thumbnail,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

@freezed
abstract class ReviewModel with _$ReviewModel {
  const factory ReviewModel({
    required int? rating,
    required String? comment,
    required DateTime? date,
    required String? reviewerName,
    required String? reviewerEmail,
  }) = _ReviewModel;

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);
}

extension ParentProductModelX on ParentProductModel {
  ParentProductEntity toEntity() {
    return ParentProductEntity(
      products: products?.map((e) => e.toEntity()).toList() ?? [],
      total: total ?? 0,
      skip: skip ?? 0,
      limit: limit ?? 0,
    );
  }
}

extension ProductModelX on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(
      id: id ?? 0,
      title: title ?? '',
      description: description ?? '',
      category: category ?? '',
      price: price ?? 0.0,
      discountPercentage: discountPercentage ?? 0.0,
      rating: rating ?? 0.0,
      stock: stock ?? 0,
      tags: tags ?? [],
      brand: brand ?? '',
      warrantyInformation: warrantyInformation ?? '',
      shippingInformation: shippingInformation ?? '',
      availabilityStatus: availabilityStatus ?? '',
      reviews: reviews?.map((e) => e.toEntity()).toList() ?? [],
      returnPolicy: returnPolicy ?? '',
      minimumOrderQuantity: minimumOrderQuantity ?? 1,
      images: images ?? [],
      thumbnail: thumbnail,
    );
  }
}

extension ReviewModelX on ReviewModel {
  ReviewEntity toEntity() {
    return ReviewEntity(
      rating: rating ?? 0,
      comment: comment ?? '',
      date: date ?? DateTime.now(),
      reviewerName: reviewerName ?? '',
      reviewerEmail: reviewerEmail ?? '',
    );
  }
}
