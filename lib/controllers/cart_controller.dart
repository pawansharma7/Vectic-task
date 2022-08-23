import 'package:flutter/material.dart';

class ProductCart with ChangeNotifier {
  List _selectedItems = [];
  int _totalPrice = 0;
  int _qty = 0;
  int _totalQty = 0;
  List<String> qtyy = ['1', '1', '1'];

  List get selectedItems => _selectedItems;
  int get totalPrice => _totalPrice;
  int get qty => _qty;
  int get totalQty => _totalQty;

  void addToCart(String productName, String productPrice) {
    _selectedItems.add(productName);
    _totalPrice = _totalPrice + int.parse(productPrice);
    notifyListeners();
  }

  void increaseQuantity(
      String productPrice, String productQuantity, int index) {
    _totalPrice = _totalPrice + int.parse(productPrice);
    // _qty = _qty + int.parse(productQuantity);
    _totalQty = _totalQty + int.parse(productQuantity);
    notifyListeners();
  }

  void decreaseQuantity(String productPrice, String productQuantity) {
    _totalPrice = _totalPrice - int.parse(productPrice);
    // _qty = _qty + int.parse(productQuantity);
    _totalQty = _totalQty - int.parse(productQuantity);
    notifyListeners();
  }

  void removeFromCart(String productName, String productPrice) {
    _selectedItems.remove(productName);
    _totalPrice = _totalPrice - int.parse(productPrice);
    notifyListeners();
  }

  void clearCart() {
    _selectedItems = [];
    _totalPrice = 0;
    _qty = 0;
    _totalQty = 0;
    notifyListeners();
  }
}
