enum ProductCategoryEnum {
  all,
  nike,
  adidas,
  puma,
  vans,
  reebok,
}

class CategoryList {
  final String name;
  final ProductCategoryEnum category;

  CategoryList({
    required this.name,
    required this.category,
  });
}

List<CategoryList> categoryList = [
  CategoryList(name: "All", category: ProductCategoryEnum.all),
  CategoryList(name: "Nike", category: ProductCategoryEnum.nike),
  CategoryList(name: "Adidas", category: ProductCategoryEnum.adidas),
  CategoryList(name: "Puma", category: ProductCategoryEnum.puma),
  CategoryList(name: "Vans", category: ProductCategoryEnum.vans),
  CategoryList(name: "Reebok", category: ProductCategoryEnum.reebok),
];
