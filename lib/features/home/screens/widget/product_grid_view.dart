import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:task/features/home/model/category_list_model.dart';
import 'package:task/features/home/providers/home_provider.dart';

import '../../../../common/constant/colors.dart';
import '../../../../common/constant/sizes.dart';
import '../../../../utils/helper/helper_function.dart';
import '../../../../utils/routes/routes/route_constant.dart';
import '../../model/product_list_model.dart';
import 'logo.dart';

class ProductGridView extends ConsumerStatefulWidget {
  const ProductGridView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductGridViewState();
}

class _ProductGridViewState extends ConsumerState<ProductGridView> {
  void navigateToProductDetailPage(BuildContext context, ProductList product) {
    context.pushNamed(
      AppRouteConstant.productDetailRouteName,
      pathParameters: {'productId': product.productId ?? ""},
      queryParameters: {'product': product.toJson()},
    );
  }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeProvider);
    final homeController = ref.watch(homeProvider.notifier);

    final screenSize = AppHelperFunctions.screenSize(context);
    final availableHeight =
        screenSize.height - kToolbarHeight - kBottomNavigationBarHeight;

    return SizedBox(
      height: availableHeight + 15,
      child: FutureBuilder<List<ProductList>>(
          future: ref.watch(
              allProductsProvider(ref.watch(homeProvider).filterModel).future),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final allProductsList = snapshot.data ?? [];

            final productsList = allProductsList
                .where((product) =>
                    product.category == homeState.selectedCategory.name ||
                    homeState.selectedCategory.name == "All")
                .toList();

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: AppSizes.appBarHeight),
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
                            if (homeState.filterModel.isAnyFilterApplied) {
                              homeController.resetFilters();
                            }

                            homeController.setCategory(category);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSizes.md),
                            child: Text(
                              category.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                      color:
                                          homeState.selectedCategory == category
                                              ? AppColors.black
                                              : AppColors.darkGrey),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: false,
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15.0,
                    ),
                    itemCount: productsList.length,
                    itemBuilder: (context, index) {
                      final product = productsList[index];

                      // final averageRating =
                      //     calculateAverageRating(product.productId ?? "", reviewList);
                      // final reviewCount =
                      //     getReviewCount(product.productId ?? "", reviewList);
                      return GestureDetector(
                        // onTap: () {
                        //   print("Product ID: ${product.productId}");
                        // },
                        onTap: () => navigateToProductDetailPage(
                          context,
                          product,
                          // product.productId ?? "",
                          // calculateAverageRating(product.productId ?? "", reviewList),
                          // getReviewCount(product.productId ?? "", reviewList),
                        ),
                        child: Column(
                          children: [
                            Flexible(
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: SizedBox(
                                      child: Image.asset(
                                        product.imagePath ??
                                            "assets/images/no-image.png",
                                        fit: BoxFit.cover,
                                        width: 175.0,
                                      ),
                                    ),
                                  ),
                                  BrandLogo(
                                    product: product,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: AppSizes.spaceBtwItems,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppSizes.md),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.productName ?? "",
                                    maxLines: 1,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        size: 12.0,
                                        color: AppColors.yellow,
                                      ),
                                      Text(
                                        (product.averageRating ?? 0)
                                            .toStringAsFixed(2),
                                        // averageRating.toStringAsFixed(1),
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall,
                                      ),
                                      const SizedBox(
                                        width: AppSizes.xs,
                                      ),
                                      Text(
                                        '(${product.reviewCount} reviews)',
                                        // '(${reviewCount} reviews)',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "\$${product.price}",
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }),
    );
  }
}
