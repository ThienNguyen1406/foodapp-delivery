import 'package:flutter/material.dart';
import 'package:foodapp_delivery/res/theme/colors/app_colors.dart';
import 'package:foodapp_delivery/res/theme/fonts/app_fonts.dart';

class SnackBarCheckoutWidget extends StatefulWidget {
  const SnackBarCheckoutWidget({super.key});

  @override
  State<SnackBarCheckoutWidget> createState() => _SnackBarCheckoutWidgetState();
}

class _SnackBarCheckoutWidgetState extends State<SnackBarCheckoutWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Checkout",
                style: AppFonts.GilroyBasic600(24, AppColors.textColor_Black),
              ),
              Icon(
                Icons.close,
                size: 16,
              ),
            ],
          ),
          Container(
            height: 1,
            color: Colors.grey,
          ),

          Row(
            children: [
                
            ],
          )
        ],
      ),
    );
  }
}
