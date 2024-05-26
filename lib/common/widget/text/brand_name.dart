import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BrandName extends ConsumerWidget {
  final String brandName;
  const BrandName({
    super.key,
    required this.brandName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      brandName,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}