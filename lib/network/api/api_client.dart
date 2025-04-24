import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:foodapp_delivery/network/api/api_response.dart';
import 'package:foodapp_delivery/utils/app_functions.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient {
  //Khai báo các method
  static const String post = "POST";
  static const String get = "GET";
  static const String put = "PUT";
  static const String delete = "DELETE";
  static const String patch = "PATCH";

  // khởi tạo dio

  static final BaseOptions defaultOptions = BaseOptions(
      method: post,
      connectTimeout: const Duration(seconds: 50),
      receiveTimeout: const Duration(seconds: 5),
      responseType: ResponseType.json);
  Dio _dio = Dio();
  static final Map<BaseOptions, ApiClient> _instanceMap = {};

  // tạo instance ApiClient phù hợp với cấu hình
  factory ApiClient({BaseOptions? options}) {
    options ??=
        defaultOptions; //Nếu options không được truyền vào (null), thì gán bằng defaultOptions
    final ApiClient apiClient = ApiClient._create(options: options);
    _instanceMap[options] = apiClient;
    return apiClient;
  }

  // tạo request dio_pretty để xem log request và response trả về trên cửa sổ debug
  ApiClient._create({BaseOptions? options}) {
    options ??= defaultOptions;
    _dio = Dio(options);
    _dio.interceptors.add(PrettyDioLogger(
        requestHeader: false,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
  }

  static ApiClient get instance => ApiClient();

  Future<ApiResponse> request({
    required String url,
    required method,
    String? data,
    Map<String, dynamic>? formData,
    Map<String, dynamic>? queryParams,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token") ?? "null";
    Map<String, dynamic> headerOptions = {
      "Bear": token,
    };
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return ApiResponse(
        status: "-2", // lỗi không có kết nối internet
        payload: null,
        message: "Không có kết nối internet",
      );
    }
    if (url == "") {
      AppFunctions.log(
          "!!!!!!!! URL is null !!!!!!!!!!!  -  data: Lỗi không có url");
    }
    try {
      final response = await _dio.request(url,
          data: formData != null
              ? FormData.fromMap(formData)
              : data ?? jsonEncode({}),
          queryParameters: queryParams,
          options: Options(
            method: method,
            sendTimeout: const Duration(minutes: 1),
            receiveTimeout: const Duration(minutes: 1),
            headers: headerOptions,
            contentType: formData != null ? "multi-part/form-data" : null,
          ));

      return ApiResponse.fromJson(response.data);
    } on DioException catch (e) {
      return ApiResponse(
        status: "-1", // lỗi không nhận dio
        payload: "dio error",
        message: e.message,
      );
    }
  }
}
