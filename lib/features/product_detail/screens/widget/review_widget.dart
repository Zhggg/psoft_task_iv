// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../../common/constant/image_string.dart';
// import '../../../../common/constant/sizes.dart';
// import '../../../../common/constant/text_string.dart';
// import '../../../../common/widget/text/brand_name.dart';
// import '../../../../utils/devices/device_utility.dart';
// import '../../../home/model/product_list_model.dart';
// import '../../../review/model/review_list_model.dart';
// import '../../../review/model/user_list_model.dart';
// import '../../../review/screens/widget/review_listview.dart';


// class ReviewWidget extends ConsumerWidget {
//   final List<ProductList> product;
//   final int itemCount;
//   final String imagePath, name, feedback;
//   final double rating;
//   const ReviewWidget( {
//     super.key,
//     required this.product,
    
//    required this.itemCount, 
//    required this.imagePath, 
//    required this.name, 
//    required this.feedback, 
//    required this.rating,
//   });

//  @override
//   Widget build(BuildContext context, ref) {
    
//     final double screenHeight = AppDeviceUtility.getScreenHeight(context);
//     // final filteredReviews = reviewList
//     //     .where((review) => review.productId == product.productId)
//     //     .toList();

//     // final topThreeUsers = filteredReviews.length >= 3
//     //     ? userList
//     //         .where((user) => filteredReviews
//     //             .sublist(0, 3)
//     //             .any((review) => review.userId == user.userId))
//     //         .toList()
//     //     : [];
//     return Container(
//       height: screenHeight + 100,
//       color: Colors.red,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           BrandName(
//             brandName: " ${AppTextString.reviewTitle} ${reviewList.length}",
//           ),
//           SizedBox(
//             height: AppSizes.spaceBtwItems,
//           ),
//           SizedBox(
//             height: screenHeight - 200,
//             child: filteredReviews.isEmpty
//                 ? CustomReviewListview(
//                     physics: NeverScrollableScrollPhysics(),
//                     reviewList: product,
//                     itemCount: itemCount,
//                     imagePath: imagePath,
//                     rating: rating,
//                     name: name,
//                     feedback: feedback,
//                   )
//                 : Center(
//                     child: Text(
//                       AppTextString.noCmtTitle,
//                       style: Theme.of(context).textTheme.titleSmall,
//                     ),
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// class ReviewWidget extends ConsumerStatefulWidget {
//   final ProductList? product;
//   final int itemCount;
//   final String imagePath, name, feedback;
//   final double rating;
//   const ReviewWidget( {
//     super.key,
//     this.product,
    
//    required this.itemCount, 
//    required this.imagePath, 
//    required this.name, 
//    required this.feedback, 
//    required this.rating,
//   });

//   @override
//   ConsumerState<ReviewWidget> createState() => _ReviewWidgetState();
// }

// class _ReviewWidgetState extends ConsumerState<ReviewWidget> {
//   @override
//   Widget build(BuildContext context) {
//     final product = widget.product;
//     final double screenHeight = AppDeviceUtility.getScreenHeight(context);
//     final filteredReviews = reviewList
//         .where((review) => review.productId == product?.productId)
//         .toList();

//     final topThreeUsers = filteredReviews.length >= 3
//         ? userList
//             .where((user) => filteredReviews
//                 .sublist(0, 3)
//                 .any((review) => review.userId == user.userId))
//             .toList()
//         : [];
//     return Container(
//       height: screenHeight + 100,
//       color: Colors.red,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           BrandName(
//             brandName: " ${AppTextString.reviewTitle} ${reviewList.length}",
//           ),
//           SizedBox(
//             height: AppSizes.spaceBtwItems,
//           ),
//           SizedBox(
//             height: screenHeight - 200,
//             child: filteredReviews.isEmpty
//                 ? CustomReviewListview(
//                     physics: NeverScrollableScrollPhysics(),
//                     reviewList: filteredReviews,
//                     itemCount: itemCount,
//                     imagePath: imagePath,
//                     rating: rating,
//                     name: name,
//                     feedback: feedback,
//                   )
//                 : Center(
//                     child: Text(
//                       AppTextString.noCmtTitle,
//                       style: Theme.of(context).textTheme.titleSmall,
//                     ),
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
// }
