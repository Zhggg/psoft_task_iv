import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task/features/review/model/review_list_model.dart';
import 'package:task/features/review/model/user_list_model.dart';

final reviewsProvider = FutureProvider.family<List<ReviewList>, ReviewRequest>(
    (ref, reviewRequest) async {
  final reviewsListResp = reviewRequest.length != null
      ? await FirebaseFirestore.instance
          .collection('reviews')
          .doc(reviewRequest.productId)
          .collection('reviews')
          .limit(reviewRequest.length ?? 3)
          .get()
      : await FirebaseFirestore.instance
          .collection('reviews')
          .doc(reviewRequest.productId)
          .collection('reviews')
          .get();

  final reviewsAsync = reviewsListResp.docs.map((doc) async {
    final review = ReviewList.fromMap(doc.data());
    final allUsers =
        (await FirebaseFirestore.instance.collection('users').get())
            .docs
            .map((doc) => UserList.fromMap(doc.data()))
            .toList();

    final userDetails =
        allUsers.firstWhere((user) => user.userId == review.userId);

    return review.copyWith(user: userDetails);
  }).toList();

  final reviews = await Future.wait(reviewsAsync);

  return reviews;
});

class ReviewRequest {
  final String productId;
  final int? length;

  ReviewRequest({
    required this.productId,
    this.length,
  });
}
