// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../../common/constant/image_string.dart';

class ProductList {
  final String? imagePath;
  final String? productName;
  final String? category;
  final String? gender;
  final String? description;
  final String? productId;
  final num? price;
  // final int numReviews;
  double? averageRating = 0.0;
  int? reviewCount = 0;

  ProductList({
    required this.imagePath,
    required this.productId,
    required this.productName,
    required this.category,
    required this.price,
    required this.gender,
    required this.description,
    // required this.numReviews,
    this.averageRating = 0.0,
    this.reviewCount = 0,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imagePath': imagePath,
      'productName': productName,
      'category': category,
      'gender': gender,
      'description': description,
      'productId': productId,
      'price': price,
      'averageRating': averageRating,
      'reviewCount': reviewCount,
    };
  }

  factory ProductList.fromMap(Map<String, dynamic> map) {
    return ProductList(
      imagePath: map['imagePath'] as String?,
      productName: map['productName'] as String?,
      category: map['category'] as String?,
      gender: map['gender'] as String?,
      description: map['description'] as String?,
      productId: map['productId'] as String?,
      price: map['price'] as num?,
      averageRating: map['averageRating'] as double?,
      reviewCount: map['reviewCount'] as int?,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductList.fromJson(String source) =>
      ProductList.fromMap(json.decode(source) as Map<String, dynamic>);

  ProductList copyWith({
    String? imagePath,
    String? productName,
    String? category,
    String? gender,
    String? description,
    String? productId,
    num? price,
    double? averageRating,
    int? reviewCount,
  }) {
    return ProductList(
      imagePath: imagePath ?? this.imagePath,
      productName: productName ?? this.productName,
      category: category ?? this.category,
      gender: gender ?? this.gender,
      description: description ?? this.description,
      productId: productId ?? this.productId,
      price: price ?? this.price,
      averageRating: averageRating ?? this.averageRating,
      reviewCount: reviewCount ?? this.reviewCount,
    );
  }
}

List<ProductList> productList = [
  // Adidas List
  ProductList(
    productId: "P_1",
    imagePath: AppImagesString.adidasImage1,
    productName: "Adizero Electric Snack Attack",
    category: "Adidas",
    price: 130,
    gender: "Men",
    description:
        "Experience lightning-fast speed and unstoppable traction with the Adizero Electric Snack Attack shoes from Adidas.",
    // numReviews: 120,
  ),
  ProductList(
    productId: "P_2",
    imagePath: AppImagesString.adidasImage2,
    productName: "Adizero Electric Speed Juice",
    category: "Adidas",
    price: 140,
    gender: "Women",
    description:
        "Stay ahead of the competition with the Adizero Electric Speed Juice shoes from Adidas, featuring advanced energy return and lightweight cushioning.",
    // numReviews: 85,
  ),
  ProductList(
    productId: "P_3",
    imagePath: AppImagesString.adidasImage3,
    productName: "Forum Low Shoes",
    category: "Adidas",
    price: 90,
    gender: "Unisex",
    description:
        "Experience iconic style and comfort with the Forum Low shoes from Adidas, featuring a classic design and cushioned sole.",
    // numReviews: 230,
  ),
  ProductList(
    productId: "P_4",
    imagePath: AppImagesString.adidasImage4,
    productName: "Supernova Rise Shoes",
    category: "Adidas",
    price: 140,
    gender: "Men",
    description:
        "Elevate your performance with the Supernova Rise shoes from Adidas, featuring advanced cushioning and energy return for a smooth ride.",
    // numReviews: 150,
  ),
  ProductList(
    productId: "P_5",
    imagePath: AppImagesString.adidasImage5,
    productName: "Ultraboost 1.0 Shoes",
    category: "Adidas",
    price: 190,
    gender: "Men",
    description:
        "Experience unmatched energy return and cushioning with the Ultraboost 1.0 shoes from Adidas, featuring a sleek design and comfortable fit.",
    // numReviews: 410,
  ),
  ProductList(
    productId: "P_6",
    imagePath: AppImagesString.adidasImage6,
    productName: "Y3 Superstar",
    category: "Adidas",
    price: 330,
    gender: "Women",
    description:
        "Make a statement with the bold and stylish Y3 Superstar shoes from Adidas, featuring a unique design and comfortable fit.",
    // numReviews: 65,
  ),

  // Nike List
  ProductList(
    productId: "P_7",
    imagePath: AppImagesString.nikeImage1,
    productName: "Air Max 1 87",
    category: "Nike",
    price: 240,
    gender: "Men",
    description:
        "Experience classic style and cushioning with the Air Max 1 87 shoes from Nike, featuring a timeless design and comfortable fit.",
    // numReviews: 350,
  ),
  ProductList(
    productId: "P_8",
    imagePath: AppImagesString.nikeImage2,
    productName: "Air Max 1",
    category: "Nike",
    price: 399,
    gender: "Unisex",
    description:
        "The Nike Air Max 1 is a classic sneaker that features the iconic Air cushioning unit in the heel, providing comfortable all-day wear.",
    // numReviews: 200,
  ),
  ProductList(
    productId: "P_9",
    imagePath: AppImagesString.nikeImage3,
    productName: "Alphafly 3",
    category: "Nike",
    price: 370,
    gender: "Men",
    description:
        "The Nike Alphafly 3 is a high-performance running shoe designed for speed and comfort. It features a carbon fiber plate and ZoomX foam for a responsive and propulsive ride.",
    // numReviews: 180,
  ),
  ProductList(
    productId: "P_10",
    imagePath: AppImagesString.nikeImage4,
    productName: "Mercurial Superfly 9 Elite",
    category: "Nike",
    price: 390,
    gender: "Men",
    description:
        "The Nike Mercurial Superfly 9 Elite is a soccer cleat that offers unrivaled speed and agility on the field. It features a dynamic fit collar for a snug and secure fit, and a micro-textured upper for superior ball control.",
    // numReviews: 145,
  ),
  ProductList(
    productId: "P_11",
    imagePath: AppImagesString.nikeImage5,
    productName: "Nike Air Max",
    category: "Nike",
    price: 230,
    gender: "Unisex",
    description:
        "The Nike Air Max is a versatile sneaker that is perfect for everyday wear. It features a visible Air unit in the heel for cushioning and shock absorption, and a durable rubber outsole for traction and durability.",
    // numReviews: 120,
  ),
  ProductList(
    productId: "P_12",
    imagePath: AppImagesString.nikeImage6,
    productName: "Romaleos 4",
    category: "Nike",
    price: 270,
    gender: "Men",
    description:
        "The Nike Romaleos 4 is a powerlifting shoe that provides a stable and secure platform for heavy lifts. It features a adjustable strap and a wide base for maximum support and stability.",
    // numReviews: 95,
  ),
  ProductList(
    productId: "P_13",
    imagePath: AppImagesString.nikeImage7,
    productName: "Sustinale Material Shoes",
    category: "Nike",
    price: 230,
    gender: "Men",
    description:
        "The Nike Sustinale Material Shoes are a stylish and comfortable sneaker that is perfect for everyday wear. They feature a breathable mesh upper and a cushioned midsole for all-day comfort.",
    // numReviews: 210,
  ),
  ProductList(
    productId: "P_14",
    imagePath: AppImagesString.nikeImage8,
    productName: "Vaporfly 3 Shoes",
    category: "Nike",
    price: 330,
    gender: "Men",
    description:
        "The Nike Vaporfly 3 is a high-performance running shoe designed for speed and efficiency. It features a ZoomX foam midsole and a carbon fiber plate for a responsive and propulsive ride.",
    // numReviews: 320,
  ),
  ProductList(
    productId: "P_15",
    imagePath: AppImagesString.nikeImage9,
    productName: "Tatum 2 Legacy",
    category: "Nike",
    price: 129,
    gender: "Men",
    description:
        "The Nike Tatum 2 Legacy is a basketball shoe that offers superior cushioning and support on the court. It features a Zoom Air unit in the forefoot and a solid rubber outsole for durability and traction.",
    // numReviews: 130,
  ),

  // Puma List
  ProductList(
    productId: "P_16",
    imagePath: AppImagesString.pumaImage1,
    productName: "Artificial Ground Shoes",
    category: "Puma",
    price: 220,
    gender: "Unisex",
    description:
        "Designed for artificial ground surfaces, these shoes provide excellent traction and control.",
    // numReviews: 75,
  ),
  ProductList(
    productId: "P_17",
    imagePath: AppImagesString.pumaImage2,
    productName: "FENTY x PUMA Creeper Phatty",
    category: "Puma",
    price: 190,
    gender: "Women",
    description:
        "Elevate your style with these bold and edgy sneakers, designed in collaboration with FENTY.",
    // numReviews: 140,
  ),
  ProductList(
    productId: "P_18",
    imagePath: AppImagesString.pumaImage3,
    productName: "LOVE MARATHON ForeverRun",
    category: "Puma",
    price: 150,
    gender: "Unisex",
    description:
        "Built for long-distance running, these shoes provide superior comfort and support.",
    // numReviews: 90,
  ),
  ProductList(
    productId: "P_19",
    imagePath: AppImagesString.pumaImage4,
    productName: "Mercedes AMG Petronas F1 Team x Mad Dog Jones",
    category: "Puma",
    price: 110,
    gender: "Unisex",
    description:
        "Get ready to speed up your style with these limited-edition sneakers, inspired by the world of Formula 1 racing.",
    // numReviews: 60,
  ),
  ProductList(
    productId: "P_20",
    imagePath: AppImagesString.pumaImage5,
    productName: "PUMA x PALOMO Nitefox Leather Loafer",
    category: "Puma",
    price: 180,
    gender: "Men",
    description:
        "Elevate your formal style with these sleek and sophisticated loafers, designed in collaboration with PALOMO.",
    // numReviews: 70,
  ),

  // Reebok List
  ProductList(
    productId: "P_21",
    imagePath: AppImagesString.reebokImage1,
    productName: "Club C Revenge Vintage Shoes",
    category: "Reebok",
    price: 90,
    gender: "Men",
    description:
        "Step back in time with these vintage-inspired sneakers, featuring a classic design and comfortable fit.",
    // numReviews: 160,
  ),
  ProductList(
    productId: "P_22",
    imagePath: AppImagesString.reebokImage2,
    productName: "Court Victory Pump",
    category: "Reebok",
    price: 160,
    gender: "Men",
    description:
        "Get ready to dominate the court with these high-performance sneakers, designed for basketball players.",
    // numReviews: 210,
  ),
  ProductList(
    productId: "P_23",
    imagePath: AppImagesString.reebokImage3,
    productName: "Floatzing Symmetros Shoes",
    category: "Reebok",
    price: 150,
    gender: "Unisex",
    description:
        "Experience comfort and style with these Floatzing Symmetros Shoes from Reebok. Perfect for casual wear, these shoes feature a sleek design and a comfortable fit.",
    // numReviews: 90,
  ),
  ProductList(
    productId: "P_24",
    imagePath: AppImagesString.reebokImage4,
    productName: "Hotwheel Classic Leather Step",
    category: "Reebok",
    price: 65,
    gender: "Unisex",
    description:
        "Add a touch of classic style to your wardrobe with these Hotwheel Classic Leather Step shoes from Reebok. Made with high-quality leather, these shoes are both durable and stylish.",
    // numReviews: 75,
  ),
  ProductList(
    productId: "P_25",
    imagePath: AppImagesString.reebokImage5,
    productName: "Preseason 94 Dynamic Shoes",
    category: "Reebok",
    price: 130,
    gender: "Men",
    description:
        "Get ready to take your fitness game to the next level with these Preseason 94 Dynamic Shoes from Reebok. Designed for high-performance, these shoes feature a dynamic design and advanced technology for superior comfort and support.",
    // numReviews: 110,
  ),
  ProductList(
    productId: "P_26",
    imagePath: AppImagesString.reebokImage6,
    productName: "Reebok v JJJJound Club",
    category: "Reebok",
    price: 150,
    gender: "Men",
    description:
        "Make a statement with these Reebok v JJJJound Club shoes. Featuring a bold design and premium materials, these shoes are perfect for fashion enthusiasts who want to stand out from the crowd.",
    // numReviews: 90,
  ),

  // Vans List
  ProductList(
    productId: "P_27",
    imagePath: AppImagesString.vansImage1,
    productName: "Classic Slip-on Checkboard",
    category: "Vans",
    price: 60,
    gender: "Women",
    description:
        "Add a touch of classic style to your wardrobe with these Classic Slip-on Checkboard shoes from Vans. Featuring a timeless design and comfortable fit, these shoes are perfect for casual wear.",
    // numReviews: 120,
  ),

  ProductList(
    productId: "P_28",
    imagePath: AppImagesString.vansImage2,
    productName: "Hylane Shoes",
    category: "Vans",
    price: 90,
    gender: "Unisex",
    description:
        "Experience comfort and style with these Hylane Shoes from Vans. Featuring a sleek design and advanced technology, these shoes are perfect for anyone who wants a comfortable and stylish footwear option.",
    // numReviews: 169,
  ),

  ProductList(
    productId: "P_29",
    imagePath: AppImagesString.vansImage3,
    productName: "Old Skool Shoes",
    category: "Vans",
    price: 70,
    gender: "men",
    description:
        "Get ready to make a statement with these Old Skool Shoes from Vans. Featuring a classic design and comfortable fit, these shoes are perfect for anyone who wants to add a touch of retro style to their wardrobe.",
    // numReviews: 200,
  ),

  ProductList(
    productId: "P_30",
    imagePath: AppImagesString.vansImage4,
    productName: "Together as Ourselves Wavyne",
    category: "Vans",
    price: 110,
    gender: "Unisex",
    description:
        "Experience the ultimate in comfort and style with these Together as Ourselves Wavyne shoes from Vans. Featuring a unique design and advanced technology, these shoes are perfect for anyone who wants a premium footwear option.",
    // numReviews: 120,
  ),
];
