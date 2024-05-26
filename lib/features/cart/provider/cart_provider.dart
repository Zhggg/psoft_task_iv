import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task/features/cart/model/cart_model.dart';

import '../service/local_storage_service.dart';

final cartProvider = StateProvider<List<CartItem>>((ref) => []);

// Function to add item to the cart
Future<void> addToCart(WidgetRef ref, CartItem item) async {
  final currentCart = ref.read(cartProvider);
  final existingItemIndex = currentCart
      .indexWhere((cartItem) => cartItem.productId == item.productId);

  if (existingItemIndex != -1) {
    // Item already exists in cart, update quantity
    final updatedItem = CartItem(
      imageUrl: item.imageUrl,
      productId: item.productId,
      name: item.name,
      price: item.price,
      brand: item.brand,
      quantity: currentCart[existingItemIndex].quantity + item.quantity,
      
    );
    currentCart[existingItemIndex] = updatedItem;
  } else {
    // Item does not exist in cart, add it
    currentCart.add(item);
  }

  final cartService = ref.read(localStorageProvider);
  await cartService.saveCart(currentCart);

  ref.read(cartProvider.notifier).state = currentCart;
}

// Function to load cart from local storage
Future<List<CartItem>> loadCart(WidgetRef ref) async {
  final cartService = ref.read(localStorageProvider); // Access service
  final storedCart = await cartService.loadCart();
  return storedCart;
}

Future<void> removeFromCart(WidgetRef ref, String productId) async {
  final currentCart = ref.read(cartProvider);
  final updatedCart =
      currentCart.where((item) => item.productId != productId).toList();
  final cartService = ref.read(localStorageProvider);
  await cartService.saveCart(updatedCart);
  ref.read(cartProvider.notifier).state = updatedCart; // Update state
}
