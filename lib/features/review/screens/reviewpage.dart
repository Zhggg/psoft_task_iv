import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:task/common/constant/colors.dart';
import 'package:task/common/constant/text_string.dart';
import 'package:task/common/widget/image/circular_image.dart';
import 'package:task/common/widget/text/appbar_title.dart';
import 'package:task/features/home/model/product_list_model.dart';
import 'package:task/features/review/model/review_list_model.dart';
import 'package:task/features/review/provider/review_provider.dart';
import 'package:task/utils/helper/helper_function.dart';

import '../../../common/constant/sizes.dart';

class ReviewPage extends ConsumerStatefulWidget {
  final ProductList? product;

  const ReviewPage({super.key, required this.product});

  @override
  ConsumerState<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends ConsumerState<ReviewPage> {
  RatingList selectedRating = ratingList.first;
  List<ReviewList> filteredStarList = reviewList;

  void onRatingSelected(RatingList rating) {
    setState(() {
      selectedRating = rating;
      // filteredStarList = filterRating(reviewList, rating);
    });
  }

  // List<ReviewList> filterRating(List<ReviewList> reviews, RatingList rating) {
  //   if (rating.rating == RatingEnum.all) {
  //     return reviews;
  //   } else {
  //     return reviews.where((review) => review.rating == rating.name).toList();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: AppBarTitle(title: AppTextString.reviewTitle + "(4)"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder<List<ReviewList>>(
                  future: ref.watch(reviewsProvider(
                          ReviewRequest(productId: widget.product!.productId!))
                      .future),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting ||
                        snapshot.data == null) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    final allReviews = snapshot.data ?? [];

                    final reviews = allReviews
                        .where((review) =>
                            selectedRating.rating == RatingEnum.all ||
                            review.rating >= selectedRating.rating.value &&
                                review.rating < selectedRating.rating.value + 1)
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
                              itemCount: ratingList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final rating = ratingList[index];
                                return GestureDetector(
                                  onTap: () {
                                    onRatingSelected(rating);
                                    // filterRating(reviews, rating);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: AppSizes.md),
                                    child: Text(
                                      rating.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                              color: selectedRating == rating
                                                  ? AppColors.black
                                                  : AppColors.darkGrey),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: reviews.length,
                            itemBuilder: (context, index) {
                              final review = reviews[index];

                              return Container(
                                width: AppHelperFunctions.screenSize(context)
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
                                        imagePath: review.user?.avatarUrl ??
                                            "assets/images/users/u1.jpg",
                                        applyImageRadius: true,
                                        radius: 100,
                                        width: 60,
                                        height: 60,
                                      ),
                                      MaxGap(AppSizes.md),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: 15.0,
                                          left: 12.0,
                                        ),
                                        child: SizedBox(
                                          width: AppHelperFunctions.screenSize(
                                                      context)
                                                  .width -
                                              95,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                review.user?.fullName ??
                                                    "No Name",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge,
                                              ),
                                              SizedBox(height: AppSizes.xs),
                                              RatingBarIndicator(
                                                rating: review.rating,
                                                itemBuilder:
                                                    (context, rating) => Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                itemCount: 5,
                                                itemSize: 17.0,
                                                unratedColor:
                                                    Colors.amber.withAlpha(50),
                                              ),
                                              SizedBox(height: AppSizes.sm),
                                              Opacity(
                                                opacity: 0.8,
                                                child: Text(
                                                  review.feedback,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                      ],
                    );
                  }),
            ],
          ),
        ));
  }
}
