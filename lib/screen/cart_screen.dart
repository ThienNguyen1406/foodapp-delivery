import 'package:flutter/material.dart';
import 'package:foodapp_delivery/res/assets/app_images.dart';
import 'package:foodapp_delivery/res/theme/colors/app_colors.dart';
import 'package:foodapp_delivery/res/theme/fonts/app_fonts.dart';
import 'package:foodapp_delivery/widget/product_item_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double totalPrice = 0.0;


  // Giỏ hàng tạm thời với danh sách sản phẩm
  final List<ProductItemWidget> cartItems = [
    ProductItemWidget(title: "Bell Pepper", price: 4.99),
    ProductItemWidget(
      title: "Egg Chicken Red",
      price: 1.99,
      imageProduct: Image.asset(AppImages.EggsImage),
      info: "4pcs, Price",
    ),
    ProductItemWidget(
      title: "Organic Bananas",
      price: 3.00,
      imageProduct: Image.asset(AppImages.Banana_Image),
      info: "12kg, Price",
    ),
    ProductItemWidget(
      title: "Ginger",
      price: 1.99,
      imageProduct: Image.asset(AppImages.GingerImage),
      info: "250gm, Price",
    ),
  ];

  @override
  void initState() {
    super.initState();
    totalPriceProduct();
  }

  void totalPriceProduct() {
    totalPrice = cartItems.fold(0, (sum, item) => sum + (item.price ?? 0));
    setState(() {});
  }

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
                  "My Cart",
                  style: AppFonts.GilroyBold400(20, AppColors.textColor_Black),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border:
                      Border(bottom: BorderSide(width: 1, color: Colors.grey))),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: cartItems
                      .map((item) => Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: item,
                          ))
                      .toList(),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: AppColors.primary_Color,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Go to Checkout",
                      style: AppFonts.GilroyBasic600(18, AppColors.white_Color),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Color(0XFF489E67),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "\$${totalPrice.toStringAsFixed(2)}",
                        style:
                            AppFonts.GilroyBold400(16, AppColors.white_Color),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
