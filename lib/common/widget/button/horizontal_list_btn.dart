import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HorizontalBtnList extends ConsumerWidget {
  final String btnText;
  final int itemCount;
  final ValueSetter<int> onItemPressed;
  final double space, stepWidth, radius, listHeight;
  final Axis scrollDirection;
  final bool Function(int index)? isItemSelected;

  const HorizontalBtnList({
    required this.btnText,
    required this.itemCount,
    required this.onItemPressed,
    this.space = 10.0,
    this.isItemSelected,
    this.stepWidth = 35.0,
    this.radius = 50.0,
    this.listHeight = 55.0,
    this.scrollDirection = Axis.horizontal,
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    return SizedBox(
      height: listHeight,
      child: ListView.builder(
        scrollDirection: scrollDirection,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          final isSelected =
              isItemSelected != null ? isItemSelected!(index) : false;
          // final isSelected = true;
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: space,
            ),
            child: ElevatedButton(
              onPressed: () => onItemPressed(index),
              child: IntrinsicWidth(
                stepWidth: stepWidth,
                child: Center(
                  child: Text(
                    btnText,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: isSelected ? Colors.black : Colors.white,
                foregroundColor: isSelected ? Colors.white : Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
