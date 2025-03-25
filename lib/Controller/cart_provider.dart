import 'package:flutter/material.dart';
import 'package:machinetask/Model/model.dart';

class CartProvider extends ChangeNotifier {
  final List<ShoeProduct> _cartItems = [];
  final Map<String, int> _quantities = {}; // Track quantities by product ID

  List<ShoeProduct> get cartItems => _cartItems;
  
  int get cartItemCount => _cartItems.length;
  
  // Get quantity for a specific product
  int getQuantity(ShoeProduct product) {
    return _quantities[product.id] ?? 1;
  }
  
  // Total items count including quantities
  int get totalItemCount {
    return _quantities.values.fold(0, (sum, quantity) => sum + quantity);
  }

  void addItem(ShoeProduct product) {
    // Check if product already exists in cart
    if (_cartItems.contains(product)) {
      increaseQuantity(product);
    } else {
      _cartItems.add(product);
      _quantities[product.id] = 1; // Initialize quantity to 1
    }
    notifyListeners();
  }

  void removeItem(ShoeProduct product) {
    _cartItems.remove(product);
    _quantities.remove(product.id);
    notifyListeners();
  }

  void increaseQuantity(ShoeProduct product) {
    if (_quantities.containsKey(product.id)) {
      _quantities[product.id] = (_quantities[product.id] ?? 1) + 1;
    } else {
      _quantities[product.id] = 1;
    }
    notifyListeners();
  }

  void decreaseQuantity(ShoeProduct product) {
    if (_quantities.containsKey(product.id)) {
      int currentQuantity = _quantities[product.id] ?? 1;
      if (currentQuantity > 1) {
        _quantities[product.id] = currentQuantity - 1;
      } else {
        // Remove the item when quantity becomes zero
        removeItem(product);
      }
      notifyListeners();
    }
  }

  // Update total price calculation to consider quantities
  double get totalPrice {
    double total = 0;
    for (var product in _cartItems) {
      total += product.price * (_quantities[product.id] ?? 1);
    }
    return total;
  }
  
  // Clear the entire cart
  void clearCart() {
    _cartItems.clear();
    _quantities.clear();
    notifyListeners();
  }
  
  // Set specific quantity for a product
  void setQuantity(ShoeProduct product, int quantity) {
    if (quantity <= 0) {
      removeItem(product);
    } else {
      if (!_cartItems.contains(product)) {
        _cartItems.add(product);
      }
      _quantities[product.id] = quantity;
      notifyListeners();
    }
  }
}