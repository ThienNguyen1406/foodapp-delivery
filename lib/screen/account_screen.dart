import 'package:flutter/material.dart';
import 'package:foodapp_delivery/res/assets/app_images.dart';
import 'package:foodapp_delivery/res/theme/colors/app_colors.dart';
import 'package:foodapp_delivery/res/theme/fonts/app_fonts.dart';
import 'package:foodapp_delivery/router/app_router.dart';
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
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Container(
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
                        // xử lý sự kiện
                      },
                      child: Icon(
                        Icons.edit,
                        size: 15,
                        color: AppColors.primary_Color,
                      )),
                ],
              ),
              SizedBox(height: 20),
              Container(
                height: 1,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: GestureDetector(
                  onTap: () {},
                  child: BasicUserWidget(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: GestureDetector(
                  onTap: () {},
                  child: BasicUserWidget(
                    iconData: Icon(Icons.menu, size: 28, color: Colors.grey),
                    infor: "My Detail",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: GestureDetector(
                  onTap: () {},
                  child: BasicUserWidget(
                    iconData:
                        Icon(Icons.location_on, size: 28, color: Colors.grey),
                    infor: "Delivery Address",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: GestureDetector(
                  onTap: () {},
                  child: BasicUserWidget(
                    iconData:
                        Icon(Icons.credit_card, size: 28, color: Colors.grey),
                    infor: "Payment Method",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: GestureDetector(
                  onTap: () {},
                  child: BasicUserWidget(
                    iconData:
                        Icon(Icons.local_activity, size: 28, color: Colors.grey),
                    infor: "Promo Card",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: GestureDetector(
                  onTap: () {},
                  child: BasicUserWidget(
                    iconData:
                        Icon(Icons.notifications, size: 28, color: Colors.grey),
                    infor: "Notifecations",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: GestureDetector(
                  onTap: () {},
                  child: BasicUserWidget(
                    iconData: Icon(Icons.help, size: 28, color: Colors.grey),
                    infor: "Help",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: GestureDetector(
                  onTap: () {},
                  child: BasicUserWidget(
                    iconData: Icon(Icons.info, size: 28, color: Colors.grey),
                    infor: "About",
                  ),
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRouter.loginScreen);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 18),
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Color(0XFFF2F3F2),
                    borderRadius: BorderRadius.circular(19),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Icon(
                          Icons.login,
                          size: 18,
                          color: AppColors.primary_Color,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Log Out",
                          style: AppFonts.GilroyBasic600(
                              18, AppColors.primary_Color),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
