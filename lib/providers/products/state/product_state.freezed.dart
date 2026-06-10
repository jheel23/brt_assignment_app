// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductState()';
}


}

/// @nodoc
class $ProductStateCopyWith<$Res>  {
$ProductStateCopyWith(ProductState _, $Res Function(ProductState) __);
}


/// Adds pattern-matching-related methods to [ProductState].
extension ProductStatePatterns on ProductState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ProductStateInitial value)?  initial,TResult Function( _ProductStateLoading value)?  loading,TResult Function( _ProductStateLoaded value)?  loaded,TResult Function( _ProductStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductStateInitial() when initial != null:
return initial(_that);case _ProductStateLoading() when loading != null:
return loading(_that);case _ProductStateLoaded() when loaded != null:
return loaded(_that);case _ProductStateError() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ProductStateInitial value)  initial,required TResult Function( _ProductStateLoading value)  loading,required TResult Function( _ProductStateLoaded value)  loaded,required TResult Function( _ProductStateError value)  error,}){
final _that = this;
switch (_that) {
case _ProductStateInitial():
return initial(_that);case _ProductStateLoading():
return loading(_that);case _ProductStateLoaded():
return loaded(_that);case _ProductStateError():
return error(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ProductStateInitial value)?  initial,TResult? Function( _ProductStateLoading value)?  loading,TResult? Function( _ProductStateLoaded value)?  loaded,TResult? Function( _ProductStateError value)?  error,}){
final _that = this;
switch (_that) {
case _ProductStateInitial() when initial != null:
return initial(_that);case _ProductStateLoading() when loading != null:
return loading(_that);case _ProductStateLoaded() when loaded != null:
return loaded(_that);case _ProductStateError() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<ProductEntity> products,  List<String> categories,  String? selectedCategory,  String searchQuery,  int limit,  int skip,  int total,  bool isLoadingMore,  bool isOffline,  Set<int> wishlistIds)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductStateInitial() when initial != null:
return initial();case _ProductStateLoading() when loading != null:
return loading();case _ProductStateLoaded() when loaded != null:
return loaded(_that.products,_that.categories,_that.selectedCategory,_that.searchQuery,_that.limit,_that.skip,_that.total,_that.isLoadingMore,_that.isOffline,_that.wishlistIds);case _ProductStateError() when error != null:
return error(_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<ProductEntity> products,  List<String> categories,  String? selectedCategory,  String searchQuery,  int limit,  int skip,  int total,  bool isLoadingMore,  bool isOffline,  Set<int> wishlistIds)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _ProductStateInitial():
return initial();case _ProductStateLoading():
return loading();case _ProductStateLoaded():
return loaded(_that.products,_that.categories,_that.selectedCategory,_that.searchQuery,_that.limit,_that.skip,_that.total,_that.isLoadingMore,_that.isOffline,_that.wishlistIds);case _ProductStateError():
return error(_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<ProductEntity> products,  List<String> categories,  String? selectedCategory,  String searchQuery,  int limit,  int skip,  int total,  bool isLoadingMore,  bool isOffline,  Set<int> wishlistIds)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _ProductStateInitial() when initial != null:
return initial();case _ProductStateLoading() when loading != null:
return loading();case _ProductStateLoaded() when loaded != null:
return loaded(_that.products,_that.categories,_that.selectedCategory,_that.searchQuery,_that.limit,_that.skip,_that.total,_that.isLoadingMore,_that.isOffline,_that.wishlistIds);case _ProductStateError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _ProductStateInitial implements ProductState {
  const _ProductStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductState.initial()';
}


}




/// @nodoc


class _ProductStateLoading implements ProductState {
  const _ProductStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductState.loading()';
}


}




/// @nodoc


class _ProductStateLoaded implements ProductState {
  const _ProductStateLoaded({required final  List<ProductEntity> products, required final  List<String> categories, required this.selectedCategory, required this.searchQuery, required this.limit, required this.skip, required this.total, required this.isLoadingMore, required this.isOffline, required final  Set<int> wishlistIds}): _products = products,_categories = categories,_wishlistIds = wishlistIds;
  

 final  List<ProductEntity> _products;
 List<ProductEntity> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

 final  List<String> _categories;
 List<String> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  String? selectedCategory;
 final  String searchQuery;
 final  int limit;
 final  int skip;
 final  int total;
 final  bool isLoadingMore;
 final  bool isOffline;
 final  Set<int> _wishlistIds;
 Set<int> get wishlistIds {
  if (_wishlistIds is EqualUnmodifiableSetView) return _wishlistIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_wishlistIds);
}


/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductStateLoadedCopyWith<_ProductStateLoaded> get copyWith => __$ProductStateLoadedCopyWithImpl<_ProductStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductStateLoaded&&const DeepCollectionEquality().equals(other._products, _products)&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.skip, skip) || other.skip == skip)&&(identical(other.total, total) || other.total == total)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.isOffline, isOffline) || other.isOffline == isOffline)&&const DeepCollectionEquality().equals(other._wishlistIds, _wishlistIds));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_products),const DeepCollectionEquality().hash(_categories),selectedCategory,searchQuery,limit,skip,total,isLoadingMore,isOffline,const DeepCollectionEquality().hash(_wishlistIds));

@override
String toString() {
  return 'ProductState.loaded(products: $products, categories: $categories, selectedCategory: $selectedCategory, searchQuery: $searchQuery, limit: $limit, skip: $skip, total: $total, isLoadingMore: $isLoadingMore, isOffline: $isOffline, wishlistIds: $wishlistIds)';
}


}

/// @nodoc
abstract mixin class _$ProductStateLoadedCopyWith<$Res> implements $ProductStateCopyWith<$Res> {
  factory _$ProductStateLoadedCopyWith(_ProductStateLoaded value, $Res Function(_ProductStateLoaded) _then) = __$ProductStateLoadedCopyWithImpl;
@useResult
$Res call({
 List<ProductEntity> products, List<String> categories, String? selectedCategory, String searchQuery, int limit, int skip, int total, bool isLoadingMore, bool isOffline, Set<int> wishlistIds
});




}
/// @nodoc
class __$ProductStateLoadedCopyWithImpl<$Res>
    implements _$ProductStateLoadedCopyWith<$Res> {
  __$ProductStateLoadedCopyWithImpl(this._self, this._then);

  final _ProductStateLoaded _self;
  final $Res Function(_ProductStateLoaded) _then;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? products = null,Object? categories = null,Object? selectedCategory = freezed,Object? searchQuery = null,Object? limit = null,Object? skip = null,Object? total = null,Object? isLoadingMore = null,Object? isOffline = null,Object? wishlistIds = null,}) {
  return _then(_ProductStateLoaded(
products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductEntity>,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,selectedCategory: freezed == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as String?,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,skip: null == skip ? _self.skip : skip // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,isOffline: null == isOffline ? _self.isOffline : isOffline // ignore: cast_nullable_to_non_nullable
as bool,wishlistIds: null == wishlistIds ? _self._wishlistIds : wishlistIds // ignore: cast_nullable_to_non_nullable
as Set<int>,
  ));
}


}

/// @nodoc


class _ProductStateError implements ProductState {
  const _ProductStateError(this.message);
  

 final  String message;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductStateErrorCopyWith<_ProductStateError> get copyWith => __$ProductStateErrorCopyWithImpl<_ProductStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProductState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ProductStateErrorCopyWith<$Res> implements $ProductStateCopyWith<$Res> {
  factory _$ProductStateErrorCopyWith(_ProductStateError value, $Res Function(_ProductStateError) _then) = __$ProductStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ProductStateErrorCopyWithImpl<$Res>
    implements _$ProductStateErrorCopyWith<$Res> {
  __$ProductStateErrorCopyWithImpl(this._self, this._then);

  final _ProductStateError _self;
  final $Res Function(_ProductStateError) _then;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ProductStateError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
