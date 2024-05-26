import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task/common/constant/colors.dart';
import 'package:task/utils/devices/device_utility.dart';

import '../button/outline_button.dart';

class FixedContainerWith2Buttons extends ConsumerWidget {
  final double height, stepWidth, radius, opacity;
  final String button1Text, smallText, bigText;
  final VoidCallback onPressedButton1;
  final String button2Text;
  final VoidCallback onPressedButton2;
  final bool onButtonSheet;

  const FixedContainerWith2Buttons({
    Key? key,
    this.height = 85.0,
    this.radius = 50.0,
    this.opacity = 0.5,
    this.button1Text = "",
    this.smallText = "",
    this.bigText = "",
    this.onButtonSheet = false,
    required this.onPressedButton1,
    required this.button2Text,
    required this.onPressedButton2,
    this.stepWidth = 40.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final double screenWidth = AppDeviceUtility.getScreenWidth(context);

    return SizedBox(
      width: onButtonSheet ? screenWidth + 100 : screenWidth,
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
                CustomOutlineButton(
                  btnText: button1Text,
                  applyPadding: false,
                  onPressed: onPressedButton1,
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
