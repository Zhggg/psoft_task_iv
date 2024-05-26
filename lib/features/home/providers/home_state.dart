import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task/features/home/model/category_list_model.dart';
import 'package:task/features/home/model/product_filter_model.dart';
import 'package:task/features/home/model/product_list_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState(
      {required bool showLoading,
      required List<ProductList> allProducts,
      required ProductFilterModel filterModel,
      required CategoryList selectedCategory}) = _HomeState;

  factory HomeState.initial() => HomeState(
        showLoading: true,
        allProducts: [],
        filterModel: ProductFilterModel.initial(),
        selectedCategory: categoryList.first,
      );
}
