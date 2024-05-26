import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task/common/constant/colors.dart';

class ColorBtnList extends ConsumerWidget {
  final String btnText;
  final int itemCount;
  final ValueSetter<int> onItemPressed;
  final double space, stepWidth, radius, listHeight;
  final Axis scrollDirection;
  final bool Function(int index)? isItemSelected;

  const ColorBtnList({
    required this.btnText,
    required this.itemCount,
    required this.onItemPressed,
    this.space = 10.0,
    this.isItemSelected,
    this.stepWidth = 40.0,
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
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: space,
            ),
            child: ElevatedButton(
              onPressed: () => onItemPressed(index),
              child: IntrinsicWidth(
                stepWidth: stepWidth,
                child: Center(
                  child: Row(
                    children: [
                      Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Text(
                        btnText,
                        style: Theme.of(context).textTheme.titleMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: isSelected ? Colors.black : Colors.white,
                foregroundColor: isSelected ? Colors.white : Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius),
                  side: BorderSide(
                    color: isSelected ? AppColors.black : AppColors.grey,
                    width: 2.0,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
