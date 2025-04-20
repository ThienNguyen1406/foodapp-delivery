import 'package:flutter/material.dart';
import 'package:foodapp_delivery/res/assets/app_images.dart';
import 'package:foodapp_delivery/res/theme/colors/app_colors.dart';
import 'package:foodapp_delivery/res/theme/fonts/app_fonts.dart';

class BassicWidget extends StatelessWidget {
  final int? cartId;
  final int? userId;
  final int? prodId;
  final int? qty;
  final int? catId;
  final int? brandId;
  final int? typeId;
  final String? name;
  final String? detail;
  final String? unitName;
  final String? unitValue;
  final String? nutritionWeight;
  final double? price;
  final String? createdDate;
  final String? modifyDate;
  final String? catName;
  final int? isFav;
  final String? brandName;
  final String? typeName;
  final double? offerPrice;
  final String? startDate;
  final String? endDate;
  final int? isOfferActive;
  final String? image;
  final double? itemPrice;
  final double? totalPrice;
  final Function()? onTap;
  final Function()? onAddToCartTap;

  const BassicWidget({
    super.key,
    this.cartId,
    this.userId,
    this.prodId,
    this.qty,
    this.catId,
    this.brandId,
    this.typeId,
    this.name,
    this.detail,
    this.unitName,
    this.unitValue,
    this.nutritionWeight,
    this.price,
    this.createdDate,
    this.modifyDate,
    this.catName,
    this.isFav,
    this.brandName,
    this.typeName,
    this.offerPrice,
    this.startDate,
    this.endDate,
    this.isOfferActive,
    this.image,
    this.itemPrice,
    this.totalPrice,
    this.onTap,
    this.onAddToCartTap,
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
          mainAxisSize: MainAxisSize.max, // Giới hạn chiều cao của Column
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                child: image != null
                    ? (image!.startsWith('http')
                        ? Image.network(
                            image!,
                            width: double.infinity,
                            height: 100,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                AppImages.Banana_Image,
                                width: double.infinity,
                                height: 100,
                                fit: BoxFit.fitHeight,
                              );
                            },
                          )
                        : Image.asset(
                            image!,
                            width: double.infinity,
                            height: 100,
                            fit: BoxFit.fitHeight,
                          ))
                    : Image.asset(
                        AppImages.Banana_Image,
                        width: double.infinity,
                        height: 100,
                        fit: BoxFit.fitHeight,
                      ),
              ),
            ),
            // const SizedBox(height: 16),
            Text(
              name ?? "Nhập tên của sản phẩm",
              style: AppFonts.GilroySemiBold400(16, AppColors.textColor_Black),
              overflow: TextOverflow.ellipsis,
            ),
            // const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  unitValue ?? '7',
                  style: AppFonts.GilroyMedium400(14, AppColors.greyText),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(unitName ?? "pcs")
              ],
            ),
            const SizedBox(height: 12),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Text(
                    "\$${price?.toStringAsFixed(2) ?? 4.99}",
                    style:
                        AppFonts.GilroyBasic600(18, AppColors.textColor_Black),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      if (onTap != null) {
                        onTap!();
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
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
