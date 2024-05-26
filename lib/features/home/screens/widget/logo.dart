import 'package:flutter/material.dart';
import 'package:flutter_any_logo/flutter_logo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task/common/constant/image_string.dart';
import 'package:task/features/home/model/product_list_model.dart';

import '../../../../common/widget/listview/custom_listview.dart';

class BrandLogo extends ConsumerWidget {
  final ProductList product;
  // final List<ProductList>? products;
  final bool applyListWithText;
  final NullableIndexedWidgetBuilder? itemBuilder;
  final double listHeight;
  final int? itemCount;
  final Axis scrollDirection;
  final GestureTapCallback? onTap;
  final CrossAxisAlignment? crossAxisAlignment;
  final String listTitle, listSubTitle;

  const BrandLogo({
    super.key,
    this.crossAxisAlignment,
    required this.product,
    // this.products,
    this.listTitle = "",
    this.listSubTitle = "",
    this.itemBuilder,
    this.applyListWithText = false,
    this.listHeight = 126,
    this.itemCount,
    this.scrollDirection = Axis.horizontal,
    this.onTap,
  });

  String getCategoryLogo(String category) {
    switch (category) {
      case "Adidas":
        return AnyLogo.fashion.adidas.path;
      case "Nike":
        return AnyLogo.fashion.nike.path;
      case "Puma":
        return AnyLogo.fashion.puma.path;
      case "Reebok":
        return AnyLogo.fashion.reebok.path;
      case "Vans":
        return AnyLogo.fashion.vans.path;
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String imagePath = getCategoryLogo(product.category ?? "");

    return applyListWithText
        ? CustomListView(
            height: listHeight,
            onTap: () {},
            itemCount: 10,
            applyImage: true,
            imagePath: AppImagesString.adidasImage1,
            applyTitleSubtitle: true,
            crossAxisAlignment: CrossAxisAlignment.center,
            title: "Category",
            subtitle: "100 Items",
          )
        : Positioned(
            left: 5.0,
            top: 5.0,
            child: SizedBox(
              height: 40.0,
              width: 40.0,
              child: Opacity(opacity: 0.2, child: Image.asset(imagePath)),
            ),
          );
  }
}
