import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ElevatedButtonWithIcon extends ConsumerWidget {
  final double buttonWidth;
  final IconData icon;
  final String btnText;
  final bool isRoundBorder;
  final double radius;
  final VoidCallback onPressed;

  const ElevatedButtonWithIcon({
    super.key,
    required this.buttonWidth,
    required this.icon,
    required this.btnText,
    required this.onPressed,
    this.isRoundBorder = false,
    this.radius = 50,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: buttonWidth,
      child: ElevatedButton.icon(
          onPressed: onPressed,
          icon: Icon(icon),
          label: Text(btnText),
          style: isRoundBorder
              ? ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius),
                  ),
                )
              : null),
    );
  }
}
