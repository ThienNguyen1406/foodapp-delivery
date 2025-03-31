import 'package:flutter/material.dart';
import 'package:foodapp_delivery/res/assets/app_images.dart';
import 'package:foodapp_delivery/res/theme/colors/app_colors.dart';
import 'package:foodapp_delivery/res/theme/fonts/app_fonts.dart';

class GroceriesWidget extends StatelessWidget {
  final Image? imageSection;
  final String? title;
  final Color? colorData;
  const GroceriesWidget(
      {super.key, this.imageSection, this.title, this.colorData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: colorData?.withOpacity(0.15) ??
              Color(0XFFF8A44C).withOpacity(0.15),
          border: Border.all(
            color: colorData?.withOpacity(0.15) ??
                Color(0XFFF8A44C).withOpacity(0.15),
            width: 1, // Viền 1px
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0x00000000),
              offset: const Offset(0, 15),
              blurRadius: 12,
              spreadRadius: 0,
            ),
          ],
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Image(image: AssetImage(AppImages.image_geo1)),
            ),
            Padding(
              padding: EdgeInsets.only(right: 32),
              child: Text(
                title ?? "Pulses",
                style: AppFonts.GilroyBasic600(20, AppColors.textColor_Black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
