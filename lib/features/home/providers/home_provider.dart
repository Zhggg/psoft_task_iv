import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task/features/home/model/category_list_model.dart';
import 'package:task/features/home/model/product_filter_model.dart';
import 'package:task/features/home/model/product_list_model.dart';
import 'package:task/features/home/providers/home_state.dart';
import 'package:task/features/home/utils/home_utils.dart' as hu;
import 'package:task/features/review/model/user_list_model.dart';

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier();
});

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier() : super(HomeState.initial());

  void updateFilter(ProductFilterModel filterModel) {
    state = state.copyWith(filterModel: filterModel);
  }

  void resetFilters() {
    state = state.copyWith(filterModel: ProductFilterModel.initial());
  }

  void setCategory(CategoryList category) {
    state = state.copyWith(selectedCategory: category);
  }
}

final allProductsProvider =
    FutureProvider.family<List<ProductList>, ProductFilterModel>(
  (ref, filterModel) async {
    final _firestore = FirebaseFirestore.instance;
    final snapshot = await _firestore
        .collection('products')
        .where('category', isEqualTo: filterModel.category?.title)
        .where('price',
            isGreaterThanOrEqualTo: filterModel.minPrice,
            isLessThanOrEqualTo: filterModel.maxPrice)
        .where('gender', isEqualTo: filterModel.gender)
        .get();

    if (filterModel.isSortByFilterApplied) {
      snapshot.docs.sort((a, b) => a['price'].compareTo(b['price']));
    }

    final productResp = snapshot.docs.map((doc) async {
      ProductList product = ProductList.fromMap(doc.data());

      final reviewResp = await hu.calculateAverageRating(product.productId!);

      product = product.copyWith(
        averageRating: reviewResp.averageRating,
        reviewCount: reviewResp.reviewCount,
      );

      return product;
    }).toList();

    final products = await Future.wait(productResp);

    return products;
  },
);

final getUserDetailsProvider = FutureProvider.family<UserList, String>(
  (ref, userId) async {
    final _firestore = FirebaseFirestore.instance;
    final snapshot = await _firestore.collection('users').doc(userId).get();
    return UserList.fromMap(snapshot.data() ?? {});
  },
);
