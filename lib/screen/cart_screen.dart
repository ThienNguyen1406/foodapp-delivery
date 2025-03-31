import 'package:flutter/material.dart';
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

  // Giỏ hàng tạm thời
  final List<ProductItemWidget> cartItems = [
    ProductItemWidget(title: "Bell Pepper", price: 4.99),
    ProductItemWidget(title: "Tomato", price: 3.50),
  ];

  @override
  void initState() {
    super.initState();
    totalPriceProduct();
    totalPrice;
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
              child: Text(
                "My Cart",
                style: AppFonts.GilroyBold400(20, AppColors.textColor_Black),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return cartItems[index];
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 80),
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
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Color(0XFF489E67),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      "\$${totalPrice.toStringAsFixed(2)}",
                      style: AppFonts.GilroyBold400(16, AppColors.white_Color),
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
