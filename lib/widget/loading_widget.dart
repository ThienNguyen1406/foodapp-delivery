
import 'package:flutter/material.dart';
import 'package:foodapp_delivery/res/theme/colors/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      color: Colors.black.withOpacity(0.6),
      child: Center(
          child: Stack(
        children: [
          const SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: Color(0XFF666666),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(), // them logo
            ),
          ),
        ],
      )),
    );
  }
}
