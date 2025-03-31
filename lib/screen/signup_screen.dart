import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foodapp_delivery/res/assets/app_images.dart';
import 'package:foodapp_delivery/res/theme/colors/app_colors.dart';
import 'package:foodapp_delivery/res/theme/fonts/app_fonts.dart';
import 'package:foodapp_delivery/router/app_router.dart';
import 'package:foodapp_delivery/widget/bassic_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 48),
                child: Image(
                  image: AssetImage(AppImages.CarrotImage),
                  height: 55,
                  width: 48,
                ),
              ),
            ),
            Text(
              "Sign Up",
              style: AppFonts.GilroyBasic600(26, AppColors.textColor_Black),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 16, top: 8),
              child: Text(
                "Enter your credentials to continue",
                style: AppFonts.GilroyMedium400(16, AppColors.greyText),
              ),
            ),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: 'Import Username',
                hintStyle: const TextStyle(color: Colors.grey),
                labelText: "Username",
                labelStyle: AppFonts.GilroyBasic600(16, AppColors.greyText),
              ),
              keyboardType: TextInputType.text,
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Your email address',
                hintStyle: const TextStyle(color: Colors.grey),
                labelText: "Email",
                labelStyle: AppFonts.GilroyBasic600(16, AppColors.greyText),
              ),
              keyboardType: TextInputType.text,
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              controller: passwordController,
              obscureText: _isObscure,
              decoration: InputDecoration(
                hintText: 'Password input',
                hintStyle: const TextStyle(color: Colors.grey),
                labelText: "Password",
                labelStyle: AppFonts.GilroyBasic600(16, AppColors.greyText),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
              ),
              keyboardType: TextInputType.text,
            ),
            SizedBox(
              height: 16,
            ),
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontFamily: 'Gilroy-Medium',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
                children: [
                  TextSpan(text: 'By continuing you agree to our '),
                  TextSpan(
                    text: 'Terms of Service',
                    style: const TextStyle(color: AppColors.primary_Color),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        //thao tác chuyển màn
                      },
                  ),
                  TextSpan(text: ' and '),
                  TextSpan(
                    text: 'Privacy Policy.',
                    style: const TextStyle(color: AppColors.primary_Color),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        //thao tác chuyển màn
                      },
                  ),
                ],
              ),
            ),
            Spacer(),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRouter.homeScreen);
                },
                child: BassicButton(
                  title: "Sign Up",
                )),
            Container(
              padding: EdgeInsets.only(bottom: 32),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style:
                        AppFonts.GilroyBasic600(14, AppColors.textColor_Black),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                    // onTap: () {
                    //   Navigator.pushNamed(context, AppRouter.homeScreen);
                    // },
                    child: Text(
                      "Singup",
                      style:
                          AppFonts.GilroyBasic600(14, AppColors.primary_Color),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
