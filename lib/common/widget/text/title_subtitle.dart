import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constant/sizes.dart';

class TitleWithSubtitle extends ConsumerWidget {
  final String title;
  final String subTitle;
  const TitleWithSubtitle({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
        child: Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItems / 3,
        ),
        Text(
          subTitle,
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ],
    ));
  }
}


