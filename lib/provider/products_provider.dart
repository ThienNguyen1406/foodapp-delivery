import 'package:flutter/material.dart';

class ProductsProvider  extends ChangeNotifier{
  final List<Map<String, dynamic>> _productsList = [];

  List<Map<String, dynamic>> get productsList => _productsList;
  
  void addProduct(Map<String, dynamic> product) {
    int index = _productsList.indexWhere((item) => item['id'] == product['id']);
    if (index != -1) {
      _productsList[index]['quantity'] += 1;
    } else {
      product['quantity'] = 1;
      _productsList.add(product);
    }
    notifyListeners();
  }

  void updateProduct(String productId, int quantity) {
    int index = _productsList.indexWhere((item) => item['id'] == productId);
    if (index != -1 && quantity > 0) {
      _productsList[index]['quantity'] = quantity;
      notifyListeners();
    }
  }

  void removeProduct(String productId) {
    _productsList.removeWhere((item) => item['id'] == productId);
    notifyListeners();
  }

  void findProduct(String name) {
    int index = _productsList.indexWhere((item) => item['name'] == name);
    if (index != -1) {
      notifyListeners();
    }
  }

  void clearProducts() {
    _productsList.clear();
    notifyListeners();
  }

  double get totalPrice {
    return _productsList.fold(
        0, (sum, item) => sum + (item['price'] * item['quantity']));
  }
 }