import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constant/colors.dart';

class CustomOutlineButton extends ConsumerWidget {
  final double buttonHeight, radius, borderWidth;
  final bool applyPadding, bigBtnText, applyInfineWidth;
  final String btnText;
  final VoidCallback onPressed;
  final Color borderColor;

  const CustomOutlineButton({
    super.key,
    this.buttonHeight = 50.0,
    this.applyInfineWidth = false,
    this.radius = 30.0,
    this.borderWidth = 2.0,
    this.applyPadding = false,
    this.borderColor = AppColors.grey,
    this.bigBtnText = true,
    required this.btnText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context, ref) {
    return SizedBox(
      width: applyInfineWidth ? double.infinity : 165,
      child: applyPadding
          ? Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: OutlinedButton(
                onPressed: onPressed,
                child: Text(
                  btnText,
                  style: bigBtnText
                      ? Theme.of(context).textTheme.titleMedium
                      : Theme.of(context).textTheme.bodyLarge,
                ),
                style: OutlinedButton.styleFrom(
                  minimumSize: Size.fromHeight(buttonHeight),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius),
                  ),
                  side: BorderSide(
                    color: borderColor,
                    width: borderWidth,
                  ),
                ),
              ),
            )
          : OutlinedButton(
              onPressed: onPressed,
              child: Text(
                btnText,
                style: bigBtnText
                    ? Theme.of(context).textTheme.titleMedium
                    : Theme.of(context).textTheme.bodyLarge,
              ),
              style: OutlinedButton.styleFrom(
                minimumSize: Size.fromHeight(buttonHeight),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius),
                ),
                side: BorderSide(
                  color: borderColor,
                  width: borderWidth,
                ),
              ),
            ),
    );
  }
}
