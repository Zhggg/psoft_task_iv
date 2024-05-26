import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/constant/sizes.dart';
import '../../../../common/widget/image/circular_image.dart';
import '../../../home/model/product_list_model.dart';
import 'title_widget.dart';

class ProductWidget extends ConsumerWidget {
  const ProductWidget({
    super.key,
    required this.product,
  });

  final ProductList? product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Column(
        children: [
          CircularImage(
            imagePath: product?.imagePath ?? "assets/images/no-image.png",
            applyImageRadius: true,
            radius: 20,
            width: double.infinity,
            height: 350,
          ),
          SizedBox(
            height: AppSizes.spaceBtwItems,
          ),
          TitleSubtitle(
            product: product,
          ),
          SizedBox(
            height: AppSizes.spaceBtwSections,
          ),
        ],
      ),
    );
  }
}
