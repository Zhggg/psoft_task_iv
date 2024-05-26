// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:task/features/filter/data/model/brand_filter_model.dart';

class ProductFilterModel {
  //* Filter by
  final BrandFilterModel? category;
  final double? minPrice;
  final double? maxPrice;

  //* Sort by
  final String? sortBy; // recent, priceLowToHigh, priceHighToLow
  final String? gender; // man, woman, unisex

  ProductFilterModel({
    this.category,
    this.minPrice,
    this.maxPrice,
    this.sortBy,
    this.gender,
  });

  factory ProductFilterModel.initial() {
    return ProductFilterModel(
      category: null,
      minPrice: null,
      maxPrice: null,
      sortBy: null,
      gender: null,
    );
  }

  bool get isAnyFilterApplied =>
      isCategoryFilterApplied ||
      isPriceFilterApplied ||
      isSortByFilterApplied ||
      isGenderFilterApplied;

  bool get isCategoryFilterApplied => category != null;
  bool get isPriceFilterApplied => minPrice != null || maxPrice != null;
  bool get isSortByFilterApplied => sortBy != null;
  bool get isGenderFilterApplied => gender != null;

  ProductFilterModel copyWith({
    BrandFilterModel? category,
    double? minPrice,
    double? maxPrice,
    String? sortBy,
    String? gender,
  }) {
    return ProductFilterModel(
      category: category ?? this.category,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      sortBy: sortBy ?? this.sortBy,
      gender: gender ?? this.gender,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'category': category?.toMap(),
      'minPrice': minPrice,
      'maxPrice': maxPrice,
      'sortBy': sortBy,
      'gender': gender,
    };
  }

  factory ProductFilterModel.fromMap(Map<String, dynamic> map) {
    return ProductFilterModel(
      category: map['category'] != null
          ? BrandFilterModel.fromMap(map['category'] as Map<String, dynamic>)
          : null,
      minPrice: map['minPrice'] != null ? map['minPrice'] as double : null,
      maxPrice: map['maxPrice'] != null ? map['maxPrice'] as double : null,
      sortBy: map['sortBy'] != null ? map['sortBy'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductFilterModel.fromJson(String source) =>
      ProductFilterModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductFilterModel(category: $category, minPrice: $minPrice, maxPrice: $maxPrice, sortBy: $sortBy, gender: $gender)';
  }

  @override
  bool operator ==(covariant ProductFilterModel other) {
    if (identical(this, other)) return true;

    return other.category == category &&
        other.minPrice == minPrice &&
        other.maxPrice == maxPrice &&
        other.sortBy == sortBy &&
        other.gender == gender;
  }

  @override
  int get hashCode {
    return category.hashCode ^
        minPrice.hashCode ^
        maxPrice.hashCode ^
        sortBy.hashCode ^
        gender.hashCode;
  }
}
