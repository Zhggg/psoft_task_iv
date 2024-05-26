class Order {
  final String orderId;
  
  final List<OrderItem> items;
  final double totalPrice;
  final OrderStatus orderStatus;
  final String paymentMethod;
  final DateTime orderDate;
  final String location;

  Order({
    required this.orderId,
    required this.items,
    required this.totalPrice,
    required this.orderStatus,
    required this.paymentMethod,
    required this.orderDate,
    required this.location,
  });
}

class OrderItem {
  final String productId;
  final String name;
  final num quantity;
  final num price;
  final String image;

  OrderItem({
    required this.productId,
    required this.name,
    required this.quantity,
    required this.price,
    required this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'name': name,
      'quantity': quantity,
      'price': price,
      'image': image,
    };
  }
}

enum OrderStatus { pending, completed, canceled }
