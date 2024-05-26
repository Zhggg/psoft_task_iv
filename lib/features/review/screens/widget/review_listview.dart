import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:task/common/constant/sizes.dart';
import 'package:task/common/widget/image/circular_image.dart';

import '../../../../utils/helper/helper_function.dart';
import '../../../review/model/review_list_model.dart';

class CustomReviewListview extends ConsumerWidget {
  final Axis scrollDirection;
  final String imagePath, name, feedback;
  final int itemCount;
  final double rating, height;
  final bool applyFullScreen;
  final ScrollPhysics physics;

  final List<ReviewList>? reviewList;
  const CustomReviewListview({
    super.key,
    this.reviewList,
    required this.imagePath,
    required this.feedback,
    required this.rating,
    this.applyFullScreen = true,
    this.height = 0.0,
    required this.name,
    required this.itemCount,
    this.scrollDirection = Axis.vertical,
    required this.physics,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = AppHelperFunctions.screenSize(context);
    final availableHeight =
        screenSize.height - kToolbarHeight - kBottomNavigationBarHeight;
    final double screenWidth = AppHelperFunctions.screenSize(context).width;
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: SizedBox(
          height: applyFullScreen ? availableHeight - 20 : height,
          width: screenWidth,
          child: ListView.builder(
              physics: physics,
              scrollDirection: scrollDirection,
              itemCount: itemCount,
              itemBuilder: (context, index) {
                return Container(
                  width: screenWidth,
                  height: 99,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9.0,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircularImage(
                          imagePath: imagePath,
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
                            width: screenWidth - 95,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                SizedBox(height: AppSizes.xs),
                                RatingBarIndicator(
                                  rating: rating,
                                  itemBuilder: (context, rating) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemCount: 5,
                                  itemSize: 17.0,
                                  unratedColor: Colors.amber.withAlpha(50),
                                ),
                                SizedBox(height: AppSizes.sm),
                                Opacity(
                                  opacity: 0.8,
                                  child: Text(
                                    feedback,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
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
              })),
    );
  }
}
