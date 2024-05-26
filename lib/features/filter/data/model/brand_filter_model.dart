// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BrandFilterModel {
  final String logo;
  final String title;
  final int items;

  BrandFilterModel({
    required this.logo,
    required this.title,
    required this.items,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'logo': logo,
      'title': title,
      'items': items,
    };
  }

  factory BrandFilterModel.fromMap(Map<String, dynamic> map) {
    return BrandFilterModel(
      logo: map['logo'] as String,
      title: map['title'] as String,
      items: map['items'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory BrandFilterModel.fromJson(String source) =>
      BrandFilterModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
