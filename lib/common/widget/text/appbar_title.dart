import 'package:flutter/material.dart';



class AppBarTitle extends StatelessWidget {
  final String title;
  final bool bigTitle;
  const AppBarTitle({
    super.key,
    required this.title,
    this.bigTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: bigTitle
          ? Theme.of(context).textTheme.headlineLarge
          : Theme.of(context).textTheme.titleMedium,
    );
  }
}
