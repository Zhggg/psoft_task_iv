import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task/common/constant/colors.dart';
import 'package:task/utils/devices/device_utility.dart';

class FixedContainerWith1Buttons extends ConsumerWidget {
  final double height, stepWidth, radius, opacity, top;
  final String smallText;
  final bool forBottomSheet;
  final num? price;

  final String button2Text;
  final VoidCallback onPressedButton2;

  const FixedContainerWith1Buttons({
    Key? key,
    this.height = 85.0,
    this.top = 100.0,
    this.radius = 50.0,
    this.opacity = 0.5,
    this.smallText = "",
    this.price,
    this.forBottomSheet = false,
    required this.button2Text,
    required this.onPressedButton2,
    this.stepWidth = 40.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final double screenWidth = AppDeviceUtility.getScreenWidth(context);

    return SizedBox(
      width: forBottomSheet ? screenWidth + 150 : screenWidth,
      height: height,
      child: Container(
        color: AppColors.light,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Opacity(
                      opacity: opacity,
                      child: Text(
                        smallText,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    Text(
                      "\$ ${price.toString()}",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: onPressedButton2,
                  child: SizedBox(
                    width: 165.0,
                    child: Center(
                      child: Text(
                        button2Text,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(radius),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
