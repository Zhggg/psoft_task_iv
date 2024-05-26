class CartItem {
  final String? imageUrl;
  final String? productId;
  final String name;
  final String brand;
  final num price;
  final num quantity;

  CartItem({
    required this.imageUrl,
    required this.brand,
    required this.productId,
    required this.name,
    required this.price,
    required this.quantity,
  });
  CartItem copyWith({
    String? imageUrl,
    String? productId,
    String? name,
    String? brand,
    num? price,
    num? quantity,
  }) {
    return CartItem(
      imageUrl: imageUrl ?? this.imageUrl,
      productId: productId ?? this.productId,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      brand: brand ?? this.brand,
    );
  }

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        imageUrl: json['imageUrl'] as String,
        productId: json['productId'] as String,
        name: json['name'] as String,
        price: json['price'] as num,
        quantity: json['quantity'] as num,
        brand: json['brand'] as String,
      );

  Map<String, dynamic> toJson() => {
        'imageUrl': imageUrl,
        'productId': productId,
        'name': name,
        'price': price,
        'quantity': quantity,
        'brand': brand,
      };
}
