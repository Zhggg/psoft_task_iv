// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:math';

import 'package:task/features/review/model/user_list_model.dart';

class ReviewList {
  final String reviewId;
  final String productId;
  final String userId;
  final String feedback;
  final double rating;
  final UserList? user;

  ReviewList({
    required this.reviewId,
    required this.productId,
    required this.userId,
    required this.feedback,
    required this.rating,
    this.user,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'reviewId': reviewId,
      'productId': productId,
      'userId': userId,
      'feedback': feedback,
      'rating': rating,
      'user': user?.toMap(),
    };
  }

  factory ReviewList.fromMap(Map<String, dynamic> map) {
    return ReviewList(
      reviewId: map['reviewId'] as String,
      productId: map['productId'] as String,
      userId: map['userId'] as String,
      feedback: map['feedback'] as String,
      rating: map['rating'] as double,
      user: map['user'] == null
          ? null
          : UserList.fromMap(map['user'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ReviewList.fromJson(String source) =>
      ReviewList.fromMap(json.decode(source) as Map<String, dynamic>);

  ReviewList copyWith({
    String? reviewId,
    String? productId,
    String? userId,
    String? feedback,
    double? rating,
    UserList? user,
  }) {
    return ReviewList(
      reviewId: reviewId ?? this.reviewId,
      productId: productId ?? this.productId,
      userId: userId ?? this.userId,
      feedback: feedback ?? this.feedback,
      rating: rating ?? this.rating,
      user: user ?? this.user,
    );
  }
}

enum RatingEnum {
  all,
  oneStar,
  twoStars,
  threeStars,
  fourStars,
  fiveStars,
}

extension RatingEnumExtension on RatingEnum {
  double get value {
    switch (this) {
      case RatingEnum.all:
        return 0.0;
      case RatingEnum.oneStar:
        return 1.0;
      case RatingEnum.twoStars:
        return 2.0;
      case RatingEnum.threeStars:
        return 3.0;
      case RatingEnum.fourStars:
        return 4.0;
      case RatingEnum.fiveStars:
        return 5.0;
    }
  }
}

class RatingList {
  final String name;
  final RatingEnum rating;

  RatingList({
    required this.name,
    required this.rating,
  });
}

List<RatingList> ratingList = [
  RatingList(name: "All", rating: RatingEnum.all),
  RatingList(name: "5 Stars", rating: RatingEnum.fiveStars),
  RatingList(name: "4 Stars", rating: RatingEnum.fourStars),
  RatingList(name: "3 Stars", rating: RatingEnum.threeStars),
  RatingList(name: "2 Stars", rating: RatingEnum.twoStars),
  RatingList(name: "1 Stars", rating: RatingEnum.oneStar),
];

// Generate a function that takes int value and returns a list of ReviewList by extracting random values from the reviewList of total length is the passed int value
List<ReviewList> generateRandomReviewList(int length) {
  List<ReviewList> randomReviewList = [];
  for (int i = 0; i < length; i++) {
    randomReviewList
        .add(reviewList[Random().nextInt(reviewList.length - 2) + 1]);
  }
  return randomReviewList;
}

List<ReviewList> reviewList = [
  ReviewList(
    reviewId: "RE_1",
    productId: "P_1",
    userId: "U_1",
    feedback: "Really good quality and comfortable for walking",
    rating: 4.0,
  ),
  ReviewList(
    reviewId: "RE_2",
    productId: "P_15",
    userId: "U_12",
    feedback: "Stylish but not very durable",
    rating: 3.0,
  ),
  ReviewList(
    reviewId: "RE_3",
    productId: "P_6",
    userId: "U_3",
    feedback: "Excellent fit and design",
    rating: 5.0,
  ),
  ReviewList(
    reviewId: "RE_4",
    productId: "P_10",
    userId: "U_15",
    feedback: "Very comfortable but a bit overpriced",
    rating: 4.0,
  ),
  ReviewList(
    reviewId: "RE_5",
    productId: "P_22",
    userId: "U_8",
    feedback: "Not as comfortable as expected",
    rating: 2.5,
  ),
  ReviewList(
    reviewId: "RE_6",
    productId: "P_18",
    userId: "U_17",
    feedback: "Great for running, highly recommend",
    rating: 4.5,
  ),
  ReviewList(
    reviewId: "RE_7",
    productId: "P_3",
    userId: "U_9",
    feedback: "Nice design but runs small",
    rating: 3.5,
  ),
  ReviewList(
    reviewId: "RE_8",
    productId: "P_25",
    userId: "U_14",
    feedback: "Comfortable and affordable",
    rating: 4.0,
  ),
  ReviewList(
    reviewId: "RE_9",
    productId: "P_30",
    userId: "U_5",
    feedback: "Amazing shoes, very comfortable",
    rating: 5.0,
  ),
  ReviewList(
    reviewId: "RE_10",
    productId: "P_12",
    userId: "U_10",
    feedback: "Good for daily use, worth the price",
    rating: 4.0,
  ),
  ReviewList(
    reviewId: "RE_11",
    productId: "P_7",
    userId: "U_18",
    feedback: "The quality could be better",
    rating: 3.0,
  ),
  ReviewList(
    reviewId: "RE_12",
    productId: "P_2",
    userId: "U_2",
    feedback: "Perfect for long walks",
    rating: 4.5,
  ),
  ReviewList(
    reviewId: "RE_13",
    productId: "P_16",
    userId: "U_6",
    feedback: "Not bad, but not great either",
    rating: 3.5,
  ),
  ReviewList(
    reviewId: "RE_14",
    productId: "P_21",
    userId: "U_20",
    feedback: "Great shoes, very stylish",
    rating: 4.5,
  ),
  ReviewList(
    reviewId: "RE_15",
    productId: "P_9",
    userId: "U_11",
    feedback: "Too tight and uncomfortable",
    rating: 2.0,
  ),
  ReviewList(
    reviewId: "RE_16",
    productId: "P_4",
    userId: "U_4",
    feedback: "Very light and comfortable, perfect for running",
    rating: 4.5,
  ),
  ReviewList(
    reviewId: "RE_17",
    productId: "P_13",
    userId: "U_13",
    feedback: "Looks good but not very durable",
    rating: 3.0,
  ),
  ReviewList(
    reviewId: "RE_18",
    productId: "P_19",
    userId: "U_19",
    feedback: "Excellent value for money",
    rating: 4.0,
  ),
  ReviewList(
    reviewId: "RE_19",
    productId: "P_24",
    userId: "U_7",
    feedback: "Good design, but not very comfortable",
    rating: 3.5,
  ),
  ReviewList(
    reviewId: "RE_20",
    productId: "P_8",
    userId: "U_16",
    feedback: "Perfect fit and very stylish",
    rating: 5.0,
  ),
  ReviewList(
    reviewId: "RE_21",
    productId: "P_28",
    userId: "U_5",
    feedback: "Affordable and comfortable for everyday use",
    rating: 4.0,
  ),
  ReviewList(
    reviewId: "RE_22",
    productId: "P_11",
    userId: "U_15",
    feedback: "Too narrow for my feet",
    rating: 2.5,
  ),
  ReviewList(
    reviewId: "RE_23",
    productId: "P_23",
    userId: "U_2",
    feedback: "Good shoes but the color faded quickly",
    rating: 3.0,
  ),
  ReviewList(
    reviewId: "RE_24",
    productId: "P_5",
    userId: "U_10",
    feedback: "Very comfortable and great for long wear",
    rating: 4.5,
  ),
  ReviewList(
    reviewId: "RE_25",
    productId: "P_20",
    userId: "U_12",
    feedback: "Not bad for the price, but could be more durable",
    rating: 3.5,
  ),
  ReviewList(
    reviewId: "RE_26",
    productId: "P_17",
    userId: "U_1",
    feedback: "Excellent shoes, very supportive",
    rating: 4.5,
  ),
  ReviewList(
    reviewId: "RE_27",
    productId: "P_26",
    userId: "U_8",
    feedback: "Good for casual wear, not for sports",
    rating: 3.5,
  ),
  ReviewList(
    reviewId: "RE_28",
    productId: "P_14",
    userId: "U_17",
    feedback: "High quality, very satisfied",
    rating: 5.0,
  ),
  ReviewList(
    reviewId: "RE_29",
    productId: "P_29",
    userId: "U_3",
    feedback: "Comfortable but the sole wore out quickly",
    rating: 3.0,
  ),
  ReviewList(
    reviewId: "RE_30",
    productId: "P_27",
    userId: "U_11",
    feedback: "Very nice shoes, fit perfectly",
    rating: 4.5,
  ),
  ReviewList(
    reviewId: "RE_31",
    productId: "P_1",
    userId: "U_13",
    feedback: "Great for daily use, very comfortable",
    rating: 4.0,
  ),
  ReviewList(
    reviewId: "RE_32",
    productId: "P_18",
    userId: "U_14",
    feedback: "Nice shoes but took time to break in",
    rating: 3.5,
  ),
  ReviewList(
    reviewId: "RE_33",
    productId: "P_7",
    userId: "U_4",
    feedback: "Stylish and comfortable, love them",
    rating: 4.5,
  ),
  ReviewList(
    reviewId: "RE_34",
    productId: "P_20",
    userId: "U_9",
    feedback: "Not very durable, but good for the price",
    rating: 3.0,
  ),
  ReviewList(
    reviewId: "RE_35",
    productId: "P_11",
    userId: "U_6",
    feedback: "Too tight, uncomfortable after long wear",
    rating: 2.5,
  ),
  ReviewList(
    reviewId: "RE_36",
    productId: "P_25",
    userId: "U_19",
    feedback: "Perfect fit and very supportive",
    rating: 5.0,
  ),
  ReviewList(
    reviewId: "RE_37",
    productId: "P_5",
    userId: "U_3",
    feedback: "Good for running, very light",
    rating: 4.0,
  ),
  ReviewList(
    reviewId: "RE_38",
    productId: "P_13",
    userId: "U_16",
    feedback: "Nice design but the sole is too hard",
    rating: 3.0,
  ),
  ReviewList(
    reviewId: "RE_39",
    productId: "P_28",
    userId: "U_12",
    feedback: "Affordable and durable, happy with the purchase",
    rating: 4.0,
  ),
  ReviewList(
    reviewId: "RE_40",
    productId: "P_24",
    userId: "U_1",
    feedback: "Very comfortable, would buy again",
    rating: 4.5,
  ),
  ReviewList(
    reviewId: "RE_41",
    productId: "P_9",
    userId: "U_20",
    feedback: "Good shoes but the size runs small",
    rating: 3.5,
  ),
  ReviewList(
    reviewId: "RE_42",
    productId: "P_21",
    userId: "U_2",
    feedback: "Great quality, very comfortable",
    rating: 4.5,
  ),
  ReviewList(
    reviewId: "RE_43",
    productId: "P_16",
    userId: "U_8",
    feedback: "Nice for casual wear but not for sports",
    rating: 3.5,
  ),
  ReviewList(
    reviewId: "RE_44",
    productId: "P_30",
    userId: "U_11",
    feedback: "Excellent shoes, very happy with the purchase",
    rating: 5.0,
  ),
  ReviewList(
    reviewId: "RE_45",
    productId: "P_19",
    userId: "U_10",
    feedback: "Comfortable but the color faded",
    rating: 3.0,
  ),
  ReviewList(
    reviewId: "RE_46",
    productId: "P_6",
    userId: "U_7",
    feedback: "Great shoes for the gym, very comfortable",
    rating: 4.5,
  ),
  ReviewList(
    reviewId: "RE_47",
    productId: "P_14",
    userId: "U_18",
    feedback: "Stylish but not very breathable",
    rating: 3.5,
  ),
  ReviewList(
    reviewId: "RE_48",
    productId: "P_27",
    userId: "U_5",
    feedback: "Perfect for everyday wear, very comfortable",
    rating: 4.0,
  ),
  ReviewList(
    reviewId: "RE_49",
    productId: "P_22",
    userId: "U_9",
    feedback: "Good shoes but the size is a bit off",
    rating: 3.0,
  ),
  ReviewList(
    reviewId: "RE_50",
    productId: "P_3",
    userId: "U_6",
    feedback: "Comfortable and stylish, highly recommend",
    rating: 4.5,
  ),
  ReviewList(
    reviewId: "RE_51",
    productId: "P_23",
    userId: "U_11",
    feedback: "Very comfortable, great for long walks",
    rating: 4.5,
  ),
  ReviewList(
    reviewId: "RE_52",
    productId: "P_29",
    userId: "U_20",
    feedback: "Nice design but not very durable",
    rating: 3.5,
  ),
  ReviewList(
    reviewId: "RE_53",
    productId: "P_10",
    userId: "U_12",
    feedback: "Good value for money, very comfortable",
    rating: 4.0,
  ),
  ReviewList(
    reviewId: "RE_54",
    productId: "P_26",
    userId: "U_13",
    feedback: "Excellent quality, very happy with the purchase",
    rating: 5.0,
  ),
  ReviewList(
    reviewId: "RE_55",
    productId: "P_8",
    userId: "U_3",
    feedback: "Comfortable but the color faded quickly",
    rating: 3.0,
  ),
  ReviewList(
    reviewId: "RE_56",
    productId: "P_17",
    userId: "U_4",
    feedback: "Great shoes, perfect fit",
    rating: 4.5,
  ),
  ReviewList(
    reviewId: "RE_57",
    productId: "P_15",
    userId: "U_2",
    feedback: "Too tight and not comfortable",
    rating: 2.5,
  ),
  ReviewList(
    reviewId: "RE_58",
    productId: "P_4",
    userId: "U_19",
    feedback: "Very comfortable and supportive",
    rating: 4.0,
  ),
  ReviewList(
    reviewId: "RE_59",
    productId: "P_30",
    userId: "U_16",
    feedback: "Amazing shoes, very durable",
    rating: 5.0,
  ),
  ReviewList(
    reviewId: "RE_60",
    productId: "P_2",
    userId: "U_8",
    feedback: "Great for outdoor activities, very durable",
    rating: 4.5,
  ),
  ReviewList(
    reviewId: "RE_61",
    productId: "P_2",
    userId: "U_8",
    feedback: "Great for outdoor activities, very durable",
    rating: 4.5,
  ),
  ReviewList(
    reviewId: "RE_62",
    productId: "P_21",
    userId: "U_7",
    feedback: "Comfortable but the color isn't as vibrant as shown",
    rating: 3.5,
  ),
  ReviewList(
    reviewId: "RE_63",
    productId: "P_11",
    userId: "U_5",
    feedback: "Very stylish and comfortable, love them",
    rating: 4.0,
  ),
  ReviewList(
    reviewId: "RE_64",
    productId: "P_19",
    userId: "U_18",
    feedback: "Not as durable as expected, but comfortable",
    rating: 3.0,
  ),
  ReviewList(
    reviewId: "RE_65",
    productId: "P_25",
    userId: "U_14",
    feedback: "Excellent shoes for the price, very happy",
    rating: 4.5,
  ),
  ReviewList(
    reviewId: "RE_66",
    productId: "P_6",
    userId: "U_10",
    feedback: "Good fit but took a while to break in",
    rating: 3.5,
  ),
  ReviewList(
    reviewId: "RE_67",
    productId: "P_30",
    userId: "U_12",
    feedback: "Amazing shoes, great for running",
    rating: 5.0,
  ),
  ReviewList(
    reviewId: "RE_68",
    productId: "P_22",
    userId: "U_16",
    feedback: "Very comfortable but not very durable",
    rating: 3.0,
  ),
  ReviewList(
    reviewId: "RE_69",
    productId: "P_7",
    userId: "U_4",
    feedback: "Perfect for long walks, very comfortable",
    rating: 4.5,
  ),
  ReviewList(
    reviewId: "RE_70",
    productId: "P_18",
    userId: "U_9",
    feedback: "Good quality but the size runs small",
    rating: 3.5,
  ),
  ReviewList(
    reviewId: "RE_71",
    productId: "P_24",
    userId: "U_15",
    feedback: "Nice design and very comfortable",
    rating: 4.0,
  ),
  ReviewList(
    reviewId: "RE_72",
    productId: "P_17",
    userId: "U_6",
    feedback: "Not very comfortable, but looks good",
    rating: 2.5,
  ),
  ReviewList(
    reviewId: "RE_73",
    productId: "P_9",
    userId: "U_19",
    feedback: "Great for running, very supportive",
    rating: 4.5,
  ),
  ReviewList(
    reviewId: "RE_74",
    productId: "P_5",
    userId: "U_11",
    feedback: "Very comfortable, would buy again",
    rating: 4.0,
  ),
  ReviewList(
    reviewId: "RE_75",
    productId: "P_28",
    userId: "U_20",
    feedback: "Comfortable and stylish, highly recommend",
    rating: 4.5,
  ),
  ReviewList(
    reviewId: "RE_76",
    productId: "P_14",
    userId: "U_1",
    feedback: "Stylish but not very durable",
    rating: 3.0,
  ),
  ReviewList(
    reviewId: "RE_77",
    productId: "P_16",
    userId: "U_2",
    feedback: "Not bad, but not great either",
    rating: 3.5,
  ),
  ReviewList(
    reviewId: "RE_78",
    productId: "P_21",
    userId: "U_3",
    feedback: "Great quality, very comfortable",
    rating: 4.5,
  ),
  ReviewList(
    reviewId: "RE_79",
    productId: "P_26",
    userId: "U_4",
    feedback: "Good for casual wear, not for sports",
    rating: 3.5,
  ),
  ReviewList(
    reviewId: "RE_80",
    productId: "P_1",
    userId: "U_5",
    feedback: "Great shoes for daily use, very comfortable",
    rating: 4.5,
  ),
];
