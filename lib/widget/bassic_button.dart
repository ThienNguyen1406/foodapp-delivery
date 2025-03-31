import 'package:flutter/material.dart';
import 'package:foodapp_delivery/res/theme/colors/app_colors.dart';
import 'package:foodapp_delivery/res/theme/fonts/app_fonts.dart';

class BassicButton extends StatelessWidget {
  final String? title;
  const BassicButton({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 32),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        width: MediaQuery.of(context).size.width*0.9,
        decoration: BoxDecoration(
          color: AppColors.primary_Color,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(
          title ?? "Name button",
          style: AppFonts.GilroyBasic600(18, AppColors.white_Color),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
