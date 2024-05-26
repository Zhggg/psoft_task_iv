// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  bool get showLoading => throw _privateConstructorUsedError;
  List<ProductList> get allProducts => throw _privateConstructorUsedError;
  ProductFilterModel get filterModel => throw _privateConstructorUsedError;
  CategoryList get selectedCategory => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {bool showLoading,
      List<ProductList> allProducts,
      ProductFilterModel filterModel,
      CategoryList selectedCategory});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showLoading = null,
    Object? allProducts = null,
    Object? filterModel = null,
    Object? selectedCategory = null,
  }) {
    return _then(_value.copyWith(
      showLoading: null == showLoading
          ? _value.showLoading
          : showLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      allProducts: null == allProducts
          ? _value.allProducts
          : allProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductList>,
      filterModel: null == filterModel
          ? _value.filterModel
          : filterModel // ignore: cast_nullable_to_non_nullable
              as ProductFilterModel,
      selectedCategory: null == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as CategoryList,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool showLoading,
      List<ProductList> allProducts,
      ProductFilterModel filterModel,
      CategoryList selectedCategory});
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showLoading = null,
    Object? allProducts = null,
    Object? filterModel = null,
    Object? selectedCategory = null,
  }) {
    return _then(_$HomeStateImpl(
      showLoading: null == showLoading
          ? _value.showLoading
          : showLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      allProducts: null == allProducts
          ? _value._allProducts
          : allProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductList>,
      filterModel: null == filterModel
          ? _value.filterModel
          : filterModel // ignore: cast_nullable_to_non_nullable
              as ProductFilterModel,
      selectedCategory: null == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as CategoryList,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl(
      {required this.showLoading,
      required final List<ProductList> allProducts,
      required this.filterModel,
      required this.selectedCategory})
      : _allProducts = allProducts;

  @override
  final bool showLoading;
  final List<ProductList> _allProducts;
  @override
  List<ProductList> get allProducts {
    if (_allProducts is EqualUnmodifiableListView) return _allProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allProducts);
  }

  @override
  final ProductFilterModel filterModel;
  @override
  final CategoryList selectedCategory;

  @override
  String toString() {
    return 'HomeState(showLoading: $showLoading, allProducts: $allProducts, filterModel: $filterModel, selectedCategory: $selectedCategory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.showLoading, showLoading) ||
                other.showLoading == showLoading) &&
            const DeepCollectionEquality()
                .equals(other._allProducts, _allProducts) &&
            (identical(other.filterModel, filterModel) ||
                other.filterModel == filterModel) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      showLoading,
      const DeepCollectionEquality().hash(_allProducts),
      filterModel,
      selectedCategory);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {required final bool showLoading,
      required final List<ProductList> allProducts,
      required final ProductFilterModel filterModel,
      required final CategoryList selectedCategory}) = _$HomeStateImpl;

  @override
  bool get showLoading;
  @override
  List<ProductList> get allProducts;
  @override
  ProductFilterModel get filterModel;
  @override
  CategoryList get selectedCategory;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
