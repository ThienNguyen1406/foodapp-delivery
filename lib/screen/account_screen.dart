import 'package:flutter/material.dart';
import 'package:foodapp_delivery/res/assets/app_images.dart';
import 'package:foodapp_delivery/res/theme/colors/app_colors.dart';
import 'package:foodapp_delivery/res/theme/fonts/app_fonts.dart';
import 'package:foodapp_delivery/widget/basic_user_widget.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage(AppImages.account_Icon),
                  height: 64,
                  width: 64,
                ),
                Column(
                  children: [
                    Text(
                      "Afsar Hossen",
                      style:
                          AppFonts.GilroyBold400(20, AppColors.textColor_Black),
                    ),
                    Text(
                      "Imshuvo97@gmail.com",
                      style: AppFonts.GilroyMedium400(16, AppColors.greyText),
                    ),
                  ],
                ),
                GestureDetector(
                    onTap: () {
                      //xử lý sự kiện
                    },
                    child: Icon(
                      Icons.edit,
                      size: 15,
                      color: AppColors.primary_Color,
                    )),
              ],
            ),
            BasicUserWidget(),
            BasicUserWidget(),
            BasicUserWidget(),
            BasicUserWidget(),
            BasicUserWidget(),
            BasicUserWidget(),
            BasicUserWidget(),
            BasicUserWidget(),
          ],
        ),
      ),
    );
  }
}
