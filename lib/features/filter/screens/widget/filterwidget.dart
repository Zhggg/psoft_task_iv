// import 'package:flutter/material.dart';
// import 'package:flutter_any_logo/flutter_any_logo.dart';
// import 'package:flutter_any_logo/flutter_logo.dart';

// import '../../../home/model/category_list_model.dart';
// import '../../../home/model/product_list_model.dart';

// Widget buildCategoryItem(CategoryList category, List<ProductList> products,
//     {Color backgroundColor = Colors.white, Color textColor = Colors.black}) {
//   int productCount = products.where((product) => product.category == category.category.name).length;

//   if (category.category == ProductCategoryEnum.all) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//       color: backgroundColor,
//       child: Row(
//         children: [
//           Text(category.name, style: TextStyle(color: textColor)),
//           Spacer(),
//           Text('$productCount Products', style: TextStyle(color: textColor)),
//         ],
//       ),
//     );
//   }

//   return Container(
//     padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//     color: backgroundColor,
//     child: Row(
//       children: [
//         AnyLogo(
//           logo: getLogoByCategory(category.category),
//           size: 30,
//         ),
//         SizedBox(width: 10),
//         Text(category.name, style: TextStyle(color: textColor)),
//         Spacer(),
//         Text('$productCount Products', style: TextStyle(color: textColor)),
//       ],
//     ),
//   );
// }

// AnyLogo getLogoByCategory(ProductCategoryEnum category) {
//   switch (category) {
//     case ProductCategoryEnum.nike:
//       return AnyLogo(logo: AnyLogoType.nike);
//     case ProductCategoryEnum.adidas:
//       return AnyLogo(logo: AnyLogoType.adidas);
//     case ProductCategoryEnum.puma:
//       return AnyLogo(logo: AnyLogoType.puma);
//     case ProductCategoryEnum.vans:
//       return AnyLogo(logo: AnyLogoType.vans);
//     case ProductCategoryEnum.reebok:
//       return AnyLogo(logo: AnyLogoType.reebok);
//     default:
//       // Consider adding a visual placeholder or error message
//       return AnyLogo(logo: AnyLogoType.error);
//   }
// }
