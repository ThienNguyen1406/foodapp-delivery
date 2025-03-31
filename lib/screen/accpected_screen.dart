import 'package:flutter/material.dart';
import 'package:foodapp_delivery/res/assets/app_images.dart';
import 'package:foodapp_delivery/res/theme/colors/app_colors.dart';
import 'package:foodapp_delivery/res/theme/fonts/app_fonts.dart';
import 'package:foodapp_delivery/router/app_router.dart';
import 'package:foodapp_delivery/widget/bassic_button.dart';

class AccpectedScreen extends StatefulWidget {
  const AccpectedScreen({super.key});

  @override
  State<AccpectedScreen> createState() => _AccpectedScreenState();
}

class _AccpectedScreenState extends State<AccpectedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.symmetric(
                  vertical: 64,
                ),
                child: Image(image: AssetImage(AppImages.order_accpected))),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                "Your Order has been accepted",
                style: AppFonts.GilroyBasic600(28, AppColors.textColor_Black),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 34),
              child: Text(
                "Your items has been placcd and is on it’s way to being processed",
                style: AppFonts.GilroyMedium400(16, AppColors.greyText),
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(),
            GestureDetector(
                onTap: () {
                  //thực thi hành động
                },
                child: BassicButton(
                  title: "Track Order",
                )),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRouter.homeScreen);
              },
              child: Padding(
                padding: EdgeInsets.only(bottom: 36),
                child: Text(
                  "Back to home",
                  style: AppFonts.GilroyBasic600(18, AppColors.textColor_Black),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
