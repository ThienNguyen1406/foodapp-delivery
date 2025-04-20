import 'package:flutter/material.dart';
import 'package:foodapp_delivery/model/user_model.dart';

class UserProvider extends ChangeNotifier {
  int? Id;
  String? name;
  String? Email;
  String? phone;
  String? createdDate;
  String? role;

  List<UserModel> _userList = [];
  List<UserModel> get userList => _userList;

  void addUser(UserModel user) {
    _userList.add(user);
    notifyListeners();
  }

  void updateUser(int index, UserModel user) {
    if (index >= 0 && index < _userList.length) {
      _userList[index] = user;
      notifyListeners();
    }
  }

  void removeUser(int index) {
    if (index >= 0 && index < _userList.length) {
      _userList.removeAt(index);
      notifyListeners();
    }
  }

  void clearUsers() {
    _userList.clear();
    notifyListeners();
  }

  void setUserDetails(int id, String name, String email, String phone,
      String createdDate, String role) {
    Id = id;
    this.name = name;
    Email = email;
    this.phone = phone;
    this.createdDate = createdDate;
    this.role = role;
    notifyListeners();
  }
}
