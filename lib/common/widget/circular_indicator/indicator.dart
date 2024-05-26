import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task/common/constant/image_string.dart';

class CustomCircularIndicator extends ConsumerWidget {
  final double radius; // Radius of the indicator
  final double strokeWidth; // Width of the colored circle
  final Color foregroundColor; // Color of the progress circle
  // The image to display in the center

  const CustomCircularIndicator({
    Key? key,
    required this.radius,
    required this.strokeWidth,
    required this.foregroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Stack(
      children: [
        // Center image
        Center(
          child: Opacity(
            opacity: 0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: SizedBox(
                child: Image.asset(
                  AppImagesString.appLogo,
                  fit: BoxFit.cover,
                  width: 50.0,
                  height: 50.0,
                ),
              ),
            ),
          ),
        ),
        // Progress circle
        Center(
          child: SizedBox(
            height: 50,
            width: 50,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(foregroundColor),
              strokeWidth: strokeWidth,
            ),
          ),
        ),
      ],
    );
  }
}
