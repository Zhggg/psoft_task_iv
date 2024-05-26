import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/constant/colors.dart';
import '../../../../common/constant/sizes.dart';
import '../../model/category_list_model.dart';
import '../../model/product_list_model.dart';

class CategoryListWidget extends ConsumerStatefulWidget {
  const CategoryListWidget({super.key});

  @override
  ConsumerState<CategoryListWidget> createState() => _CategoryListWidgetState();
}

class _CategoryListWidgetState extends ConsumerState<CategoryListWidget> {
  CategoryList selectedCategory = categoryList.first;
  List<ProductList> filteredProductList = productList;

  void onCategorySelected(CategoryList category) {
    setState(() {
      selectedCategory = category;
      filteredProductList = filterProducts(productList, category);
    });
  }

  List<ProductList> filterProducts(List<ProductList> products, CategoryList category) {
  if (category.category == ProductCategoryEnum.all) {
    return products;
  } else {
    return products.where((product) => product.category == category.category).toList();
  }
}


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.appBarHeight),
      child: SizedBox(
        height: 40,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: categoryList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final category = categoryList[index];
            return GestureDetector(
              onTap: () {
                onCategorySelected(category);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                child: Text(
                  category.name,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: selectedCategory == category
                          ? AppColors.black
                          : AppColors.darkGrey),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
