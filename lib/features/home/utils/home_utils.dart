import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task/features/review/model/review_list_model.dart';

Future<CalculateReviewResponseModel> calculateAverageRating(
    String productId) async {
  double totalRating = 0.0;
  int count = 0;

  final reviewsListResp = await FirebaseFirestore.instance
      .collection('reviews')
      .doc(productId)
      .collection('reviews')
      .get();

  final reviews = reviewsListResp.docs.map((doc) {
    return ReviewList.fromMap(doc.data());
  }).toList();

  for (ReviewList review in reviews) {
    if (review.productId == productId) {
      totalRating += review.rating;
      count++;
    }
  }
  final avgRating = count > 0 ? totalRating / count : 0.0;
  return CalculateReviewResponseModel(
      averageRating: avgRating, reviewCount: count);
}

class CalculateReviewResponseModel {
  final double averageRating;
  final int reviewCount;

  CalculateReviewResponseModel({
    required this.averageRating,
    required this.reviewCount,
  });
}
