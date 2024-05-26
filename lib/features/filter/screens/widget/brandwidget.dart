import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task/features/filter/data/model/brand_filter_model.dart';
import 'package:task/features/filter/utils/filter_utils.dart';

import '../../../../common/constant/colors.dart';
import '../../../../common/constant/sizes.dart';
import '../../../../common/widget/image/circular_image.dart';
import '../../../../common/widget/text/title_subtitle.dart';

class FilterBrandwidget extends ConsumerWidget {
  final BrandFilterModel? selected;
  final Function(BrandFilterModel?)
      onTap; // modify the onTap function to accept an integer parameter

  const FilterBrandwidget({
    Key? key,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return SizedBox(
      height: 126,
      child: ListView.builder(
        itemCount: brandFilterings.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final brand = brandFilterings[index];

          return GestureDetector(
            onTap: () => onTap(brand),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      CircularImage(
                        // radius: 200,
                        // applyImageRadius: true,
                        imagePath: brand.logo,
                      ),
                      Positioned(
                        bottom: 0.0,
                        right: 0.0,
                        child: selected?.title == brand.title
                            ? Icon(
                                Icons.check_circle,
                                color: AppColors.black,
                              )
                            : SizedBox(),
                      ),
                    ],
                  ),
                  TitleWithSubtitle(
                    title: brand.title,
                    subTitle: "${brand.items} items",
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
