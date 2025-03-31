import 'package:flutter/material.dart';
import 'package:foodapp_delivery/res/assets/app_images.dart';
import 'package:foodapp_delivery/res/theme/colors/app_colors.dart';
import 'package:foodapp_delivery/res/theme/fonts/app_fonts.dart';
import 'package:foodapp_delivery/router/app_router.dart';
import 'package:foodapp_delivery/widget/bassic_button.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white_Color,
      content: SizedBox(
        height: 525,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRouter.homeScreen);
              },
              child: Icon(
                Icons.close,
                size: 16,
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 32),
                child:
                    Center(child: Image(image: AssetImage(AppImages.dialog)))),
            Center(
              child: Text(
                "Oops! Order Failed",
                style: AppFonts.GilroyBasic600(28, AppColors.textColor_Black),
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: Text(
                "Something went tembly wrong...",
                style: AppFonts.GilroyMedium400(16, AppColors.greyText),
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(),
            GestureDetector(
                onTap: () {
                  //thực hiện hành động loading widget
                },
                child: BassicButton(
                  title: "Please try Again",
                )),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRouter.homeScreen);
              },
              child: Center(
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
      actions: [],
    );
  }
}
