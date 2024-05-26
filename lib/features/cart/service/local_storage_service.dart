import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/features/cart/model/cart_model.dart';

final localStorageProvider =
    Provider<LocalStorageService>((ref) => LocalStorageService());

class LocalStorageService {
  static const String _cartKey = 'cart_items';

  Future<void> saveCart(List<CartItem> cartItems) async {
    final prefs = await SharedPreferences.getInstance();
    final encodedData =
        jsonEncode(cartItems.map((item) => item.toJson()).toList());
    await prefs.setString(_cartKey, encodedData);
  }

  Future<List<CartItem>> loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedData = prefs.getString(_cartKey);
    if (encodedData != null) {
      final decodedData = jsonDecode(encodedData) as List<dynamic>;
      return decodedData.map((item) => CartItem.fromJson(item)).toList();
    } else {
      return [];
    }
  }

  Future<void> deleteCartItem(String productId) async {
    final prefs = await SharedPreferences.getInstance();
    final cartItems = await loadCart();
    final updatedCartItems =
        cartItems.where((item) => item.productId != productId).toList();
    final encodedData =
        jsonEncode(updatedCartItems.map((item) => item.toJson()).toList());
    await prefs.setString(_cartKey, encodedData);
  }

  Future<void> clearCart() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_cartKey);
  }
}
