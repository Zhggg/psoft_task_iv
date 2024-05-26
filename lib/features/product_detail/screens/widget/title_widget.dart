import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/constant/sizes.dart';
import '../../../home/model/product_list_model.dart';

class TitleSubtitle extends ConsumerStatefulWidget {
  const TitleSubtitle({
    super.key,
    required this.product,
  });

  final ProductList? product;

  @override
  ConsumerState<TitleSubtitle> createState() => _TitleWithSubtitleState();
}

class _TitleWithSubtitleState extends ConsumerState<TitleSubtitle> {
  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product?.productName ?? "",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(
          height: AppSizes.spaceBtwItems,
        ),
        Row(
          children: [
            RatingBarIndicator(
              rating: 4.5,
              itemBuilder: (context, rating) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 17.0,
              unratedColor: Colors.amber.withAlpha(50),
            ),
            SizedBox(width: AppSizes.xs),
            Text(
              "${product?.averageRating}",
              style: Theme.of(context).textTheme.labelSmall,
            ),
            SizedBox(width: AppSizes.xs),
            Text(
              '(${product?.reviewCount} reviews)',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ],
        ),
        SizedBox(
          height: AppSizes.spaceBtwItems,
        ),
      ],
    );
  }
}
