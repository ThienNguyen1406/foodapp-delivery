import 'package:flutter/material.dart';
import 'package:foodapp_delivery/res/assets/app_images.dart';
import 'package:foodapp_delivery/res/theme/colors/app_colors.dart';
import 'package:foodapp_delivery/res/theme/fonts/app_fonts.dart';
import 'package:foodapp_delivery/router/app_router.dart';
import 'package:foodapp_delivery/widget/bassic_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          // decoration: BoxDecoration(
          //   gradient: RadialGradient(
          //     center: const Alignment(0.0, -0.6),
          //     radius: 1.2,
          //     colors: [
          //       Color(0xFFF5F9FF),
          //       Color(0xFFFFF6F6),
          //       Color(0xFFFFF0F0),
          //     ],
          //   ),
          // ),
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
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
                "Loging",
                style: AppFonts.GilroyBasic600(26, AppColors.textColor_Black),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 16),
                child: Text(
                  "Enter your emails and password",
                  style: AppFonts.GilroyMedium400(16, AppColors.greyText),
                ),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email address',
                  hintStyle: const TextStyle(color: Colors.grey),
                  labelText: "Email",
                  labelStyle: AppFonts.GilroyBasic600(16, AppColors.greyText),
                ),
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: 20,
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
              Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Forgot Password?",
                        style: AppFonts.GilroyMedium400(
                            14, AppColors.textColor_Black),
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.pushNamed(context, AppRouter.signupScreen);
                  });
                },
                child: BassicButton(title: "Log In"),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style:
                        AppFonts.GilroyBasic600(14, AppColors.textColor_Black),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRouter.singinScreen);
                    },
                    child: Text(
                      "Singup",
                      style:
                          AppFonts.GilroyBasic600(14, AppColors.primary_Color),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
