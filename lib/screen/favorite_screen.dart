import 'package:flutter/material.dart';
import 'package:foodapp_delivery/res/theme/colors/app_colors.dart';
import 'package:foodapp_delivery/res/theme/fonts/app_fonts.dart';
import 'package:foodapp_delivery/widget/bassic_button.dart';
import 'package:foodapp_delivery/widget/favorite_widget.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  "Favorurite",
                  style:
                      AppFonts.GilroyBold400(20, AppColors.textColor_Black),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              height: 1,
              color: Colors.grey,
            ),
            Expanded(
              flex: 6,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      FavoriteWidget(),
                      FavoriteWidget(),
                      FavoriteWidget(),
                      FavoriteWidget(),
                      FavoriteWidget(),
                      FavoriteWidget(),
                      FavoriteWidget(),
                      FavoriteWidget(),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: BassicButton(
                  title: "Add All To Cart",
                ))
          ],
        ),
      ),
    );
  }
}
