import 'package:flutter/material.dart';
import 'package:foodapp_delivery/res/assets/app_images.dart';
import 'package:foodapp_delivery/res/theme/fonts/app_fonts.dart';

class FavoriteWidget extends StatelessWidget {
  final Image? imageProduct;
  final String? title;
  final String? info;
  final double? price;

  const FavoriteWidget({
    Key? key,
    this.imageProduct,
    this.title,
    this.info,
    this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Hình ảnh sản phẩm
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: imageProduct ??
                Image.asset(
                  AppImages.sprite,
                  fit: BoxFit.cover,
                ),
          ),
          const SizedBox(width: 16),
          // Thông tin sản phẩm
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title ?? "Sprite Can",
                  style: AppFonts.GilroyBold400(18, const Color(0xFF181725)),
                ),
                const SizedBox(height: 4),
                Text(
                  info ?? "325ml, Price",
                  style: AppFonts.GilroyBold400(14, const Color(0xFF7C7C7C)),
                ),
              ],
            ),
          ),

          Row(
            children: [
              Text(
                '\$${price?.toStringAsFixed(2) ?? 1.50}',
                style: AppFonts.GilroyBold400(18, const Color(0xFF181725)),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
