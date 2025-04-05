import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _cartListItem = [];

  List<Map<String, dynamic>> get cartList => _cartListItem;

  //Thêm sản phẩm vào giỏ hàng
  void addToCart(Map<String, dynamic> product) {
    int index = _cartListItem
        .indexWhere((item) => item['id'] == product['id']); //tìm sản phẩm
    if (index != -1) {
      _cartListItem[index]['quantity'] +=
          1; // nếu tồn tại thì thêm vào và +1 số lượng sản phẩm
    } else {
      product['quantity'] = 1; //nếu chưa tồn tại thì thêm vào
      _cartListItem.add(product);
    }
    notifyListeners();
  }

  //Cập nhật số lượng sản phẩm
  void updateQuantity(String productId, int quantity) {
    int index = _cartListItem.indexWhere((item) => item['id'] == productId);
    if (index != -1 && quantity > 0) {
      _cartListItem[index]['quantity'] = quantity;
      notifyListeners();
    }
  }

  //Xóa sản phẩm khỏi giỏ hàng
  void removeFromCart(String productId) {
    _cartListItem.removeWhere((item) => item['id'] == productId);
    notifyListeners();
  }

  //  Xóa toàn bộ giỏ hàng
  void clearCart() {
    _cartListItem.clear();
    notifyListeners();
  }

  //Tính tổng tiền
  double get totalPrice {
    return _cartListItem.fold(
        0, (sum, item) => sum + (item['price'] * item['quantity']));
  }
}
