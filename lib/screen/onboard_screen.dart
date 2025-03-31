import 'package:flutter/material.dart';
import 'package:foodapp_delivery/res/assets/app_images.dart';
import 'package:foodapp_delivery/res/theme/colors/app_colors.dart';
import 'package:foodapp_delivery/res/theme/fonts/app_fonts.dart';
import 'package:foodapp_delivery/router/app_router.dart';
import 'package:foodapp_delivery/widget/bassic_button.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  @override
  void initState() {
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.OnBoardImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Image(
                image: AssetImage(AppImages.Carrot_Image_White),
                height: 56.36,
                width: 48.47,
              ),
            ),
            Text(
              "Welcome",
              style: AppFonts.GilroyBasic600(48, AppColors.white_Color),
            ),
            Text(
              "to our store",
              style: AppFonts.GilroyBasic600(48, AppColors.white_Color),
            ),
            GestureDetector(
              onTap: () {
                   setState(() {
                     Navigator.pushNamed(context, AppRouter.singinScreen);
                   });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: BassicButton(title: "Get Started",))
            )
          ],
        ),
      ),
    );
  }
}
