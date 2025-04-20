import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodapp_delivery/res/assets/app_images.dart';
import 'package:foodapp_delivery/res/theme/colors/app_colors.dart';
import 'package:foodapp_delivery/res/theme/fonts/app_fonts.dart';
import 'package:foodapp_delivery/router/app_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class SingInScreen extends StatefulWidget {
  const SingInScreen({super.key});

  @override
  State<SingInScreen> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  GoogleSignInAccount? _currentUser;

  Future<void> _handleGoogleSignIn() async {
    try {
      final account = await _googleSignIn.signIn();
      if (account != null) {
        setState(() => _currentUser = account);

        final headers = await account.authHeaders;
        final response = await http.get(
          Uri.parse(
            'https://people.googleapis.com/v1/people/me/connections'
            '?personFields=names',
          ),
          headers: headers,
        );

        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          final name = data['connections']?[0]?['names']?[0]?['displayName'] ??
              'Unknown';
          Navigator.pushNamed(context, AppRouter.homeScreen);
        } else {
          print('Lỗi khi gọi People API: ${response.statusCode}');
        }
      }
    } catch (e) {
      print('Lỗi đăng nhập Google: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(AppImages.SinginImage),
            height: 374.15,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          const SizedBox(height: 24),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "Get your groceries with Nectar",
                    style:
                        AppFonts.GilroyBasic600(26, AppColors.textColor_Black),
                  ),
                ),
                Expanded(child: Container()),
              ],
            ),
          ),

          const SizedBox(height: 24),

          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AppRouter.phonenumberScreen);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.greyText.withOpacity(0.1),
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppImages.FlagVN),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      '+84',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Enter your phone number',
                      style: TextStyle(color: Colors.grey.shade400),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 40),

          Text(
            "Or connect with social media",
            style: AppFonts.GilroyBasic600(14, AppColors.greyText),
            textAlign: TextAlign.center,
          ),

          // Nút đăng nhập bằng Google
          GestureDetector(
            onTap: _handleGoogleSignIn,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(0XFF5383EC),
                  borderRadius: BorderRadius.circular(19),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.google,
                      color: Colors.white,
                      size: 32,
                    ),
                    Expanded(
                      child: Text(
                        " Continue with Google",
                        style:
                            AppFonts.GilroyBasic600(18, AppColors.white_Color),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Nút đăng nhập bằng Facebook (chưa xử lý)
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(0XFF4A66AC),
                  borderRadius: BorderRadius.circular(19),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.facebook,
                      color: Colors.white,
                      size: 32,
                    ),
                    Expanded(
                      child: Text(
                        " Continue with Facebook",
                        style:
                            AppFonts.GilroyBasic600(18, AppColors.white_Color),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
