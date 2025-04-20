import 'package:flutter/material.dart';
import 'package:foodapp_delivery/res/assets/app_images.dart';
import 'package:foodapp_delivery/res/theme/colors/app_colors.dart';
import 'package:foodapp_delivery/res/theme/fonts/app_fonts.dart';
import 'package:foodapp_delivery/router/app_router.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({super.key});

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  bool isValidPhoneNumber(String phone) {
    final regex = RegExp(r'^[0-9]{10}$'); // Example regex for a 10-digit phone number
    return regex.hasMatch(phone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
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
                padding: EdgeInsets.symmetric(vertical: 36),
                child: Text(
                  "Enter your mobile number",
                  style: AppFonts.GilroyBasic600(26, AppColors.textColor_Black),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  "Mobile Number",
                  style: AppFonts.GilroyBasic600(16, AppColors.greyText),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 32,
                    height: 24,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImages.FlagVN),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    '+84',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        hintText: 'Enter your phone number',
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                      ),
                      keyboardType: TextInputType.phone,
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.only(bottom: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
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
                            context, AppRouter.notificationScreen);
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
