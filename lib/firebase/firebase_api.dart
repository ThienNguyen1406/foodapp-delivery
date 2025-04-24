import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:foodapp_delivery/utils/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseApi {
  final databaseReference = FirebaseDatabase.instance.ref();

  // Hàm khởi tạo thông báo
  Future<void> initNotifications() async {
    // Yêu cầu quyền thông báo
    await FirebaseMessaging.instance.requestPermission(
      provisional: true,
      alert: true,
      badge: true,
      sound: true,
    );

    String? token;

    if (Platform.isIOS) {
      // Lấy APNs token cho iOS
      token = await FirebaseMessaging.instance.getAPNSToken();
    } else if (Platform.isAndroid) {
      // Lấy FCM token cho Android
      token = await FirebaseMessaging.instance.getToken();
    }

    if (token != null) {
      print("Token là: $token");
      await StorageService.setDeviceToken(token);
    }

    // FirebaseMessaging.instance.onTokenRefresh.listen((newToken) async {
    //   await saveTokenToDatabase(newToken);
    // }).onError((err) {
    //   print("Lỗi khi cập nhật token: $err");
    // });
  }
}
