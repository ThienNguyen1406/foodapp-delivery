import 'package:flutter/material.dart';
import 'package:foodapp_delivery/res/assets/app_images.dart';
import 'package:foodapp_delivery/res/theme/colors/app_colors.dart';
import 'package:foodapp_delivery/res/theme/fonts/app_fonts.dart';

class BassicWidget extends StatelessWidget {
  final Image? imageProduct;
  final String? title;
  final String? information;
  final String? price;
  final VoidCallback? onTap;

  const BassicWidget({
    super.key,
    this.imageProduct,
    this.title,
    this.information,
    this.price,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white,
        border: Border.all(
          color: const Color(0xFFE2E2E2),
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: imageProduct ??
                    Image.asset(
                      AppImages.Banana_Image,
                      width: 80,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title ?? "Nhập tên của sản phẩm",
              style: AppFonts.GilroySemiBold400(16, AppColors.textColor_Black),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Text(
              information ?? "Thông tin chi tiết",
              style: AppFonts.GilroyMedium400(14, AppColors.greyText),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Text(
                    price ?? "\$40",
                    style: AppFonts.GilroyBasic600(18, AppColors.textColor_Black),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                        color: AppColors.primary_Color,
                        borderRadius: BorderRadius.circular(17),
                      ),
                      child: const Text(
                        "+",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
