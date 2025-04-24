import 'dart:convert';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodapp_delivery/network/api/api_client.dart';
import 'package:foodapp_delivery/network/api/api_response.dart';

class ApiRequest {
  static const String domain = "http://localhost:3001";
  // đăng nhập
  static Future<ApiResponse> userLogin({
    required String username,
    required String password,
    required String deviceToken,
    required String email,
  }) async {
    Map<String, dynamic> data = {
      "username": username,
      "password": password,
      "deviceToken": deviceToken,
      "email": email,
    };

    return await ApiClient().request(
      url: "$domain/api/app/login",
      data: json.encode(data),
      method: ApiClient.post,
    );
  }

  //đăng kí
  static Future<ApiResponse> userRegister({
    required String username,
    required String password,
    required String deviceToken,
    required String email,
  }) async {
    Map<String, dynamic> data = {
      "username": username,
      "password": password,
      "deviceToken": deviceToken,
      "email": email,
    };

    return await ApiClient().request(
      url: "$domain/api/app/sign_up",
      data: json.encode(data),
      method: ApiClient.post,
    );
  }

  // lấy danh sách sản phẩm
}
