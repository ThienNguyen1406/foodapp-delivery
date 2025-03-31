import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodapp_delivery/res/assets/app_images.dart';
import 'package:foodapp_delivery/res/theme/colors/app_colors.dart';
import 'package:foodapp_delivery/res/theme/fonts/app_fonts.dart';
import 'package:foodapp_delivery/router/app_router.dart';

class SingInScreen extends StatefulWidget {
  const SingInScreen({super.key});

  @override
  State<SingInScreen> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Ảnh Banner
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
                Expanded(child: Container())
              ],
            ),
          ),

          const SizedBox(height: 24),
          // custom nhập số điện thoại
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                    width: 32,
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
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),

                  // Nhập số điện thoại để connect
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your phone number',
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            "Or connect with social media",
            style: AppFonts.GilroyBasic600(14, AppColors.greyText),
            textAlign: TextAlign.center,
          ),

          // Google Connection
          GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Color(0XFF5383EC),
                      borderRadius: BorderRadius.circular(19)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.google,
                        color: Colors.white,
                        size: 32,
                      ),
                      Expanded(
                        child: Text(
                          " Continue with Google",
                          style: AppFonts.GilroyBasic600(
                              18, AppColors.white_Color),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              )),
          //Connection with Facebook
          GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Color(0XFF4A66AC),
                      borderRadius: BorderRadius.circular(19)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.facebook,
                        color: Colors.white,
                        size: 32,
                      ),
                      Expanded(
                        child: Text(
                          " Continue with Facebook",
                          style: AppFonts.GilroyBasic600(
                              18, AppColors.white_Color),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              )),

          InkWell(
            onTap: () {
              Navigator.pushNamed(context, AppRouter.phonenumberScreen);
            },
            child: Text("Chuyển tạm thời"),
          )
        ],
      ),
    );
  }
}
