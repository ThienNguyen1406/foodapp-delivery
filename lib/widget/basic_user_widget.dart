import 'package:flutter/material.dart';
import 'package:foodapp_delivery/res/assets/app_images.dart';
import 'package:foodapp_delivery/res/theme/colors/app_colors.dart';
import 'package:foodapp_delivery/res/theme/fonts/app_fonts.dart';

class BasicUserWidget extends StatelessWidget {
  final Icon? iconData;
  final String? infor;
  const BasicUserWidget({super.key, this.iconData, this.infor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(
          color: AppColors.greyText,
          width: 1.0,
        ),
      )),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: iconData ??
                Icon(
                  Icons.shopping_bag_outlined,
                  size: 24,
                ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              infor ?? "Orders",
              style: AppFonts.GilroyBasic600(18, AppColors.textColor_Black),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Image(
              image: AssetImage(AppImages.goNext),
              color: Colors.black,
              height: 14,
              width: 10,
            ),
          ),
        ],
      ),
    );
  }
}
