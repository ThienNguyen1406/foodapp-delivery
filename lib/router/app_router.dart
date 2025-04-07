import 'package:flutter/material.dart';
import 'package:foodapp_delivery/pages/home_screen.dart';
import 'package:foodapp_delivery/pages/login_screen.dart';
import 'package:foodapp_delivery/screen/beverages_screen.dart';
import 'package:foodapp_delivery/screen/filters_screen.dart';
import 'package:foodapp_delivery/screen/notification_screen.dart';
import 'package:foodapp_delivery/screen/onboard_screen.dart';
import 'package:foodapp_delivery/screen/phone_number.dart';
import 'package:foodapp_delivery/screen/product_detail.dart';
import 'package:foodapp_delivery/screen/select_location_screen.dart';
import 'package:foodapp_delivery/screen/signup_screen.dart';
import 'package:foodapp_delivery/screen/sing_in_screen.dart';
import 'package:foodapp_delivery/screen/splash_screen.dart';

class AppRouter {
  static const String splash = '/splashScreen';
  static const String onboard = '/onboardScreen';
  static const String singinScreen = '/singinScreen';
  static const String phonenumberScreen = '/phonenumberScreen';
  static const String notificationScreen = '/notificationScreen';
  static const String locationScreen = '/locationScreen';
  static const String loginScreen = '/loginScreen';
  static const String signupScreen = '/sigupScreen';
  static const String homeScreen = '/homeScreen';
  static const String beverages = '/beveragesScreen';
  static const String filtersScreen = '/filtersScreen';
  static const String productDetail = '/productDetail';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => const SplashScreen(),
    onboard: (BuildContext context) => const OnboardScreen(),
    singinScreen: (BuildContext context) => const SingInScreen(),
    phonenumberScreen: (BuildContext context) => const PhoneNumberScreen(),
    notificationScreen: (BuildContext context) => const NotificationScreen(),
    locationScreen: (BuildContext context) => const SelectLocationScreen(),
    loginScreen: (BuildContext context) => const LoginScreen(),
    signupScreen: (BuildContext context) => const SignupScreen(),
    homeScreen: (BuildContext context) => const HomeScreen(),
    beverages: (BuildContext context) => const BeveragesScreen(selectedCategories: {}, selectedBrands: {},),
    filtersScreen: (BuildContext context) => const FiltersScreen(),
     productDetail: (BuildContext context) => const ProductDetail(),
  };
}
