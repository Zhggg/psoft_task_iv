import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constant/sizes.dart';

class CircularImage extends ConsumerWidget {
  final String imagePath;
  final bool isNetworkImage, applyImageRadius;
  final double radius;
  final BoxFit fit;
  final double width, height;
  const CircularImage(
      {super.key,
      required this.imagePath,
      this.isNetworkImage = false,
      this.applyImageRadius = false,
      this.radius = 20,
      this.fit = BoxFit.contain,
      this.width = 80,
      this.height = 80});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(radius)
              : BorderRadius.zero,
          child: SizedBox(
            width: width,
            height: height,
            child: Image(
              image: isNetworkImage
                  ? NetworkImage(imagePath)
                  : AssetImage(imagePath) as ImageProvider,
              fit: fit,
            ),
          ),
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItems / 2,
        ),
      ],
    );
  }
}
