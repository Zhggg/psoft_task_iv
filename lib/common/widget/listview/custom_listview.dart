import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constant/image_string.dart';
import '../../constant/sizes.dart';
import '../image/circular_image.dart';
import '../text/title_subtitle.dart';

class CustomListView extends ConsumerWidget {
  final double? height, width, centerHeight, centerWidth;
  final double centerTextRadius;
  final int itemCount;
  final Axis scrollDirection;
  final GestureTapCallback onTap;
  final bool applyImage, applyTitleSubtitle, applyCenterText;
  final String? title, subtitle;
  final String centerText;
  final CrossAxisAlignment crossAxisAlignment;
  final Color borderColor, centerColor;

  final String imagePath;
  // final NullableIndexedWidgetBuilder itemBuilder;
  const CustomListView({
    super.key,
    this.scrollDirection = Axis.horizontal,
    this.centerHeight,
    this.centerWidth,
    this.height,
    this.width,
    this.title,
    this.subtitle,
    this.borderColor = Colors.transparent,
    this.centerColor = Colors.transparent,
    this.centerText = "",
    this.centerTextRadius = 0.0,
    this.imagePath = AppImagesString.adidasImage1,
    this.applyImage = false,
    this.applyTitleSubtitle = false,
    this.applyCenterText = false,
    required this.itemCount,
    required this.onTap,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    // required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: height,
      width: width,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: itemCount,
        scrollDirection: scrollDirection,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.sm,
              ),
              child: Column(
                crossAxisAlignment: crossAxisAlignment,
                children: [
                  Container(
                    child: applyImage
                        ? CircularImage(
                            radius: 200,
                            applyImageRadius: true,
                            imagePath: imagePath,
                          )
                        : null,
                  ),
                  Container(
                      child: applyTitleSubtitle
                          ? TitleWithSubtitle(
                              title: "$title",
                              subTitle: "$subtitle",
                            )
                          : null),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
