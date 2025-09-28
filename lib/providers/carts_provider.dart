import 'dart:convert';
import 'package:barber_shop_app/model/product.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartItem {
  final Product product;
  int quantity;
  CartItem({required this.product, this.quantity = 1});

  Map<String, dynamic> toJson() => {
    'product': product.toJson(),
    'quantity': quantity,
  };

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
    product: Product.fromJson(json['product'] as Map<String, dynamic>),
    quantity: json['quantity'] as int,
  );
}

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];
  List<CartItem> get items => List.unmodifiable(_items);

  void add(Product p) {
    final idx = _items.indexWhere((e) => e.product.id == p.id);
    if (idx >= 0) {
      _items[idx].quantity++;
    } else {
      _items.add(CartItem(product: p));
    }
    saveToStorage();
    notifyListeners();
  }

  void remove(Product p) {
    _items.removeWhere((e) => e.product.id == p.id);
    saveToStorage();
    notifyListeners();
  }

  double get total =>
      _items.fold(0.0, (sum, e) => sum + e.product.price * e.quantity);

  Future<void> saveToStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = _items.map((e) => e.toJson()).toList();
    await prefs.setString('cart', json.encode(jsonList));
  }

  Future<void> loadFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString('cart');
    if (raw == null) return;
    final list = (json.decode(raw) as List).cast<Map<String, dynamic>>();
    _items
      ..clear()
      ..addAll(list.map(CartItem.fromJson));
    notifyListeners();
  }

  void clear() {
    _items.clear();
    saveToStorage();
    notifyListeners();
  }
}
