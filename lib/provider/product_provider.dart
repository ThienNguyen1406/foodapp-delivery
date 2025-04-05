import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _productListItem = [];

  List<Map<String, dynamic>> get productList => _productListItem;

  // Thêm sản phẩm
  void addProduct(Map<String, dynamic> product) {
    _productListItem.add(product);
    notifyListeners();
  }

  // Sửa sản phẩm theo id
  void updateProduct(String id, Map<String, dynamic> newProduct) {
    final index = _productListItem.indexWhere((item) => item['id'] == id);
    if (index != -1) {
      _productListItem[index] = newProduct;
      notifyListeners();
    }
  }

  // Xóa sản phẩm theo id
  void deleteProduct(String id) {
    _productListItem.removeWhere((item) => item['id'] == id);
    notifyListeners();
  }

  // Tìm kiếm sản phẩm theo tên
  List<Map<String, dynamic>> searchProduct(String keyword) {
    return _productListItem
        .where((item) =>
            item['name'].toString().toLowerCase().contains(keyword.toLowerCase()))
        .toList();
  }
}
