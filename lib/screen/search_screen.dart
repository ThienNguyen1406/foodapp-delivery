import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodapp_delivery/res/assets/app_images.dart';
import 'package:foodapp_delivery/router/app_router.dart';
import 'package:foodapp_delivery/widget/bassic_widget.dart';

class SearchScreen extends StatefulWidget {
  final Map<String, bool>? selectedProduct;
  const SearchScreen({super.key, this.selectedProduct});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController findController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildHeader(),
                 const SizedBox(height: 20),
                _buildProductList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0XFFF2F3F2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.black),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: findController,
              decoration: const InputDecoration(
                hintText: "Search Store",
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Expanded(child: _buildSearchBar()),
        const SizedBox(width: 12), 
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
          _buildProductItem(AppImages.coke, "Diet Coke", "335ml", "\$1.99"),
          _buildProductItem(
              AppImages.sprite, "Sprite Can", "325ml", "\$1.50"),
        ]),
        const SizedBox(height: 20),
        _buildProductRow([
          _buildProductItem(
              AppImages.applejuice, "Apple & Grape Juice", "2L", "\$12.99"),
          _buildProductItem(
              AppImages.orangejuice, "Orange Juice", "1.5L", "\$15.99"),
        ]),
        const SizedBox(height: 20),
        _buildProductRow([
          _buildProductItem(
              AppImages.cocacola, "Coca Cola Can", "325ml", "\$4.99"),
          _buildProductItem(AppImages.pepsi, "Pepsi Can", "325ml", "\$4.99"),
        ]),
        const SizedBox(height: 20),
        _buildProductRow([
          _buildProductItem(
              AppImages.applejuice, "Apple & Grape Juice", "2L", "\$12.99"),
          _buildProductItem(
              AppImages.orangejuice, "Orange Juice", "1.5L", "\$15.99"),
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
      String imagePath, String title, String info, String price) {
    return BassicWidget(
      imageProduct: Image.asset(imagePath, height: 60),
      title: title,
      information: info,
      price: price,
      onTap: () {},
    );
  }
}
