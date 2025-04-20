import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodapp_delivery/res/assets/app_images.dart';
import 'package:foodapp_delivery/res/theme/colors/app_colors.dart';
import 'package:foodapp_delivery/res/theme/fonts/app_fonts.dart';
import 'package:foodapp_delivery/router/app_router.dart';
import 'package:foodapp_delivery/widget/basic_widget.dart';

class BeveragesScreen extends StatefulWidget {
  final Map<String, bool>? selectedCategories;
  final Map<String, bool>? selectedBrands;

  const BeveragesScreen({
    super.key,
    this.selectedCategories,
    this.selectedBrands,
  });

  @override
  State<BeveragesScreen> createState() => _BeveragesScreenState();
}

class _BeveragesScreenState extends State<BeveragesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top),
              _buildHeader(context),
              const SizedBox(height: 20),
              _buildProductList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Image.asset(AppImages.goBack, height: 24),
        ),
        Text(
          "Beverages",
          style: AppFonts.GilroyBold400(20, AppColors.textColor_Black),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, AppRouter.filtersScreen),
          child: const Icon(FontAwesomeIcons.sliders, size: 24),
        ),
      ],
    );
  }

  Widget _buildProductList() {
    return Column(
      children: [
        _buildProductRow([
          _buildProductItem(AppImages.coke, "Diet Coke", "335ml", 1.99),
          _buildProductItem(AppImages.sprite, "Sprite Can", "325ml", 1.50),
        ]),
        const SizedBox(height: 20),
        _buildProductRow([
          _buildProductItem(
              AppImages.applejuice, "Apple & Grape Juice", "2L", 12.99),
          _buildProductItem(
              AppImages.orangejuice, "Orange Juice", "1.5L", 15.99),
        ]),
        const SizedBox(height: 20),
        _buildProductRow([
          _buildProductItem(AppImages.cocacola, "Coca Cola Can", "325ml", 4.99),
          _buildProductItem(AppImages.pepsi, "Pepsi Can", "325ml", 4.99),
        ]),
        const SizedBox(height: 20),
        _buildProductRow([
          _buildProductItem(
              AppImages.applejuice, "Apple & Grape Juice", "2L", 12.99),
          _buildProductItem(
              AppImages.orangejuice, "Orange Juice", "1.5L", 15.99),
        ]),
      ],
    );
  }

  Widget _buildProductRow(List<Widget> items) {
    return Row(
      children: [
        Expanded(child: items[0]),
        const SizedBox(width: 20),
        Expanded(child: items[1]),
      ],
    );
  }

  /// Widget hiển thị 1 sản phẩm
  Widget _buildProductItem(
      String imagePath, String name, String detail, double price) {
    return BassicWidget(
      image: imagePath,
      name: name,
      detail: detail,
      price: price,
      onTap: () {},
    );
  }
}
