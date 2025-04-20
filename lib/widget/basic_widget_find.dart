import 'package:flutter/material.dart';
import 'package:foodapp_delivery/res/assets/app_images.dart';
import 'package:foodapp_delivery/res/theme/colors/app_colors.dart';
import 'package:foodapp_delivery/res/theme/fonts/app_fonts.dart';

class BasicWidgetFind extends StatelessWidget {
  final Image? imageProduct;
  final String? title;
  final Color? backgroundColor;
  const BasicWidgetFind(
      {super.key, this.imageProduct, this.title, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),      child: Container( 
        height: 190,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: backgroundColor?.withOpacity(0.25) ?? const Color(0x1A53B175),
          border: Border.all(
            color: backgroundColor?.withOpacity(0.25) ?? const Color(0xB353B175),
            width: 1, // Viền 1px
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0x00000000),
              offset: const Offset(0, 6),
              blurRadius: 12,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: imageProduct ??
                  Image(
                    image: AssetImage(AppImages.anh1),
                    width: 111,
                    height: 75,
                    fit: BoxFit.contain,
                  ),
            ),
            Container(
              padding: EdgeInsets.symmetric( horizontal: 32),
              child: Text(
                title ?? "Frash Fruits & Vegetable",
                textAlign: TextAlign.center,
                style: AppFonts.GilroyBold400(16, AppColors.textColor_Black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
