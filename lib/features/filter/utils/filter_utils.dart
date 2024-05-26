import 'package:flutter_any_logo/flutter_logo.dart';
import 'package:task/features/filter/data/model/brand_filter_model.dart';

List<BrandFilterModel> brandFilterings = [
  BrandFilterModel(logo: AnyLogo.fashion.nike.path, title: "Nike", items: 10),
  BrandFilterModel(
      logo: AnyLogo.fashion.adidas.path, title: "Adidas", items: 20),
  BrandFilterModel(logo: AnyLogo.fashion.puma.path, title: "Puma", items: 30),
  BrandFilterModel(logo: AnyLogo.fashion.vans.path, title: "Vans", items: 40),
  BrandFilterModel(
      logo: AnyLogo.fashion.reebok.path, title: "Reebok", items: 50),
];

List<String> sortByList = [
  "Most Recent",
  "Price: Low to High",
  "Price: High to Low",
];

List<String> genderSortList = [
  "Men",
  "Women",
  "Unisex",
];
