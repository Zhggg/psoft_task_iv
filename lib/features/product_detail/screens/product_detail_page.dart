import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:task/common/constant/sizes.dart';
import 'package:task/common/widget/button/add_subtract_btn.dart';
import 'package:task/common/widget/container/colorlist_container.dart';
import 'package:task/common/widget/text/brand_name.dart';
import 'package:task/features/home/model/product_list_model.dart';
import 'package:task/features/product_detail/model/size_list_model.dart';
import 'package:task/features/review/model/review_list_model.dart';
import 'package:task/features/review/provider/review_provider.dart';
import 'package:task/utils/routes/routes/route_constant.dart';

import '../../../common/constant/colors.dart';
import '../../../common/constant/text_string.dart';
import '../../../common/widget/button/cart_button.dart';
import '../../../common/widget/button/outline_button.dart';
import '../../../common/widget/container/fixed_container_abtn.dart';
import '../../../common/widget/image/circular_image.dart';
import '../../../common/widget/slideup/bottomsheet.dart';
import '../../../utils/devices/device_utility.dart';
import '../../../utils/helper/helper_function.dart';

class ProductDetailPage extends ConsumerStatefulWidget {
  final ProductList? product;

  const ProductDetailPage({super.key, this.product});

  @override
  ConsumerState<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends ConsumerState<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final isDarkMode = AppHelperFunctions.isDarkMode(context);
    final double screenHeight = AppDeviceUtility.getScreenHeight(context);
    return Scaffold(
        appBar: AppBar(
          actions: [
            CartButton(),
          ],
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
              height: screenHeight,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Product Widget
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.lg,
                      ),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              CircularImage(
                                imagePath: product?.imagePath ??
                                    "assets/images/no-image.png",
                                applyImageRadius: true,
                                radius: 30,
                                width: double.infinity,
                                height: 350,
                                fit: BoxFit.fill,
                              ),
                              Positioned(
                                right: 23.0,
                                top: 310.0,
                                child: ColorContainer(),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: AppSizes.spaceBtwItems,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product?.productName ?? "-",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              SizedBox(
                                height: AppSizes.spaceBtwItems,
                              ),
                              Row(
                                children: [
                                  RatingBarIndicator(
                                    rating: product?.averageRating ?? 0.0,
                                    itemBuilder: (context, rating) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    itemCount: 5,
                                    itemSize: 17.0,
                                    unratedColor: Colors.amber.withAlpha(50),
                                  ),
                                  SizedBox(width: AppSizes.xs),
                                  Text(
                                    "${(product?.averageRating ?? 0).toStringAsFixed(2)}",
                                    style:
                                        Theme.of(context).textTheme.labelSmall,
                                  ),
                                  SizedBox(width: AppSizes.xs),
                                  Text(
                                    '(${product?.reviewCount} reviews)',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: AppSizes.spaceBtwItems,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: AppSizes.spaceBtwSections,
                          ),
                        ],
                      ),
                    ),
                    //Sized Section
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.lg,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BrandName(
                            brandName: AppTextString.sizeTitle,
                          ),
                          SizedBox(
                            height: AppSizes.spaceBtwItems,
                          ),
                          SizedBox(
                            height: 50,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: sizeList.length,
                              itemBuilder: (context, index) {
                                final size = sizeList[index];
                                int selectedIndex = -1;
                                return GestureDetector(
                                  onTap: () {
                                    selectedIndex = index;
                                    setState(() {});
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: AppSizes.sm,
                                    ),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: isDarkMode
                                              ? AppColors.darkerGrey
                                              : AppColors.darkGrey,
                                        ),
                                        borderRadius: BorderRadius.circular(50),
                                        color: selectedIndex == index
                                            ? AppColors.black
                                            : Colors.transparent,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "${size.sizes}",
                                          style: TextStyle(
                                            color: selectedIndex == index
                                                ? AppColors.white
                                                : AppColors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: AppSizes.spaceBtwSections,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BrandName(
                                  brandName: AppTextString.descTitle,
                                ),
                                SizedBox(
                                  height: AppSizes.spaceBtwItems,
                                ),
                                Opacity(
                                  opacity: 0.7,
                                  child: Text(
                                    product?.description ?? "No Description",
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                    maxLines: 3,
                                  ),
                                ),
                                SizedBox(
                                  height: AppSizes.spaceBtwSections,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Review Section
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSizes.lg,
                            ),
                            child: BrandName(
                              brandName:
                                  " ${AppTextString.reviewTitle}s (${product?.reviewCount})",
                            ),
                          ),
                          SizedBox(
                            height: AppSizes.spaceBtwItems,
                          ),
                          FutureBuilder<List<ReviewList>>(
                              future: ref.watch(reviewsProvider(ReviewRequest(
                                      productId: product!.productId!,
                                      length: 3))
                                  .future),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                        ConnectionState.waiting ||
                                    snapshot.data == null) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }

                                final reviews = snapshot.data ?? [];

                                return Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: SizedBox(
                                    height: 310.0,
                                    width:
                                        AppHelperFunctions.screenSize(context)
                                            .width,
                                    child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: reviews.length,
                                      itemBuilder: (context, index) {
                                        final review = reviews[index];

                                        return Container(
                                          width: AppHelperFunctions.screenSize(
                                                  context)
                                              .width,
                                          height: 99,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 9.0,
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CircularImage(
                                                  imagePath: review
                                                          .user?.avatarUrl ??
                                                      "assets/images/users/u1.jpg",
                                                  applyImageRadius: true,
                                                  radius: 100,
                                                  width: 60,
                                                  height: 60,
                                                ),
                                                MaxGap(AppSizes.md),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    bottom: 15.0,
                                                    left: 12.0,
                                                  ),
                                                  child: SizedBox(
                                                    width: AppHelperFunctions
                                                                .screenSize(
                                                                    context)
                                                            .width -
                                                        95,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          review.user
                                                                  ?.fullName ??
                                                              "No Name",
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyLarge,
                                                        ),
                                                        SizedBox(
                                                            height:
                                                                AppSizes.xs),
                                                        RatingBarIndicator(
                                                          rating: review.rating,
                                                          itemBuilder: (context,
                                                                  rating) =>
                                                              Icon(
                                                            Icons.star,
                                                            color: Colors.amber,
                                                          ),
                                                          itemCount: 5,
                                                          itemSize: 17.0,
                                                          unratedColor: Colors
                                                              .amber
                                                              .withAlpha(50),
                                                        ),
                                                        SizedBox(
                                                            height:
                                                                AppSizes.sm),
                                                        Opacity(
                                                          opacity: 0.8,
                                                          child: Text(
                                                            review.feedback,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodySmall,
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.lg,
                      ),
                      child: CustomOutlineButton(
                        btnText: AppTextString.seeAllBtn,
                        applyPadding: true,
                        onPressed: () {
                          context.pushNamed(
                            AppRouteConstant.reviewRouteName,
                            queryParameters: {'product': product.toJson()},
                          );
                        },
                        bigBtnText: false,
                        applyInfineWidth: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            FixedContainerWith1Buttons(
                smallText: AppTextString.priceText,
                price: product.price,
                button2Text: AppTextString.addToCartBtn,
                onPressedButton2: () {
                  ShowModelBottomSheet.show(
                    context,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.sm,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    AppTextString.addToCartTitle,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  MaxGap(1000),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    icon: Icon(Icons.close),
                                  ),
                                ],
                              ),
                              Gap(20),
                              AddSubtract(
                                applyTextField: true,
                                products: product,
                              ),
                              Gap(20),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ],
        ));
  }
}
