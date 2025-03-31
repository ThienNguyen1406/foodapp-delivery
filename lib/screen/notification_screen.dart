import 'package:flutter/material.dart';
import 'package:foodapp_delivery/res/assets/app_images.dart';
import 'package:foodapp_delivery/res/theme/colors/app_colors.dart';
import 'package:foodapp_delivery/res/theme/fonts/app_fonts.dart';
import 'package:foodapp_delivery/router/app_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final TextEditingController _pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image(image: AssetImage(AppImages.goBack)),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  "Enter your mobile number",
                  style: AppFonts.GilroyBasic600(26, AppColors.textColor_Black),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  "Code",
                  style: AppFonts.GilroyBasic600(16, AppColors.greyText),
                ),
              ),
              PinCodeTextField(
                appContext: context,
                length: 4,
                controller: _pinController,
                keyboardType: TextInputType.number,
                animationType: AnimationType.none,
                textStyle: TextStyle(fontSize: 24, color: Colors.black),
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.underline,
                  fieldHeight: 50,
                  fieldWidth: 50,
                  inactiveColor: Colors.grey,
                  activeColor: Colors.black,
                  selectedColor: Colors.black,
                  borderWidth: 1.5,
                ),
                cursorColor: Colors.black,
                onChanged: (value) {},
                onCompleted: (value) {
                  print("Completed: $value");
                },
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Resend Code",
                    style: AppFonts.GilroyMedium400(18, AppColors.primary_Color),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // if (isValidPhoneNumber(phoneController.text)) {
                        //   Navigator.pushNamed(
                        //       context, AppRouter.notificationScreen);
                        // } else {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     SnackBar(content: Text('Số điện thoại không hợp lệ')),
                        //   );
                        // }
                
                        Navigator.pushNamed(
                            context, AppRouter.locationScreen);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary_Color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      ),
                      child: Image(
                        image: AssetImage(AppImages.goNext),
                        width: 10,
                        height: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
