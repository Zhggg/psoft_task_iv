import 'package:flutter/material.dart';

class ShowModelBottomSheet {
  static void show(
    BuildContext context, {
    required List<Widget> children,
    double height = 0.5,
    bool isScrollControlled = false,
  }) {
    showModalBottomSheet(
      isScrollControlled: isScrollControlled,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: children,
            ),
          ),
        );
      },
    );
  }
}
