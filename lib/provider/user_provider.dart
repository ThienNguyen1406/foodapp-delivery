import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodapp_delivery/model/user_login_model.dart';
import 'package:foodapp_delivery/model/user_model.dart';
import 'package:foodapp_delivery/network/api/api_response.dart';
import 'package:foodapp_delivery/network/api_request.dart';

class UserProvider extends ChangeNotifier {
  int? Id;
  String? username;
  String? Email;
  String? phone;
  String? createdDate;
  String? role;
  UserLoginModel userData = UserLoginModel();

  void setUserDetails(int id, String name, String email, String phone,
      String createdDate, String role) {
    Id = id;
    this.username = name;
    Email = email;
    this.phone = phone;
    this.createdDate = createdDate;
    this.role = role;
    notifyListeners();
  }

  Future<String> userLogin({
    required String username,
    required String password,
    required String deviceToken,
    required String email,
  }) async {
    ApiResponse res = await ApiRequest.userLogin(
      username: username,
      password: password,
      deviceToken: deviceToken,
      email: email,
    );
    if (res.status == "1") {
      UserLoginModel user = UserLoginModel.fromJson(res.payload);
      return "Login successful";
    } else {
      return "Login failed";
    }
  }
}
