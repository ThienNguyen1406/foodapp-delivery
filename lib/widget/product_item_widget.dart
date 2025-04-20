import 'package:flutter/material.dart';
import 'package:foodapp_delivery/res/assets/app_images.dart';
import 'package:foodapp_delivery/res/theme/colors/app_colors.dart';
import 'package:foodapp_delivery/res/theme/fonts/app_fonts.dart';

class ProductItemWidget extends StatefulWidget {
  final Image? imageProduct;
  final String? title;
  final String? info;
  final double? price;
  final int initialQuantity;
  final Function(int)? onQuantityChanged;
  final VoidCallback? onRemove;

  const ProductItemWidget({
    Key? key,
    this.imageProduct,
    this.title,
    this.info,
    this.price,
    this.initialQuantity = 1,
    this.onQuantityChanged,
    this.onRemove, 
  }) : super(key: key);

  @override
  _ProductItemWidgetState createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
  int quantity = 1;
  double totalPrice = 0.0;

  @override
  void initState() {
    super.initState();
    quantity = widget.initialQuantity;
    totalPrice = (widget.price ?? 4.99) * quantity;
  }

  void _updateTotalPrice() {
    setState(() {
      totalPrice = (widget.price ?? 4.99) * quantity;
    });
  }

  void _increaseQuantity() {
    setState(() {
      quantity++;
      _updateTotalPrice();
    });
    widget.onQuantityChanged?.call(quantity);
  }

  void _decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
        _updateTotalPrice();
      });
      widget.onQuantityChanged?.call(quantity);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget.imageProduct ??
                  Image.asset(
                    AppImages.Bell_Pepper,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title ?? "Bell Pepper Red",
                      style: AppFonts.GilroyBold400(18, Color(0xFF181725)),
                    ),
                    Text(
                      widget.info ?? "1kg, Price",
                      style: AppFonts.GilroyBold400(14, Color(0xFF7C7C7C)),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: widget.onRemove,
                child: Icon(
                  Icons.close,
                  size: 20,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0XFFE2E2E2)),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: IconButton(
                        onPressed: _decreaseQuantity,
                        icon: Icon(Icons.remove, size: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        quantity.toString(),
                        style: AppFonts.GilroyBold400(16, Color(0xFF181725)),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0XFFE2E2E2)),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: IconButton(
                        onPressed: _increaseQuantity,
                        icon: Icon(
                          Icons.add,
                          size: 20,
                          color: AppColors.primary_Color,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 16),
                Text(
                  '\$${totalPrice.toStringAsFixed(2)}',
                  style: AppFonts.GilroyBold400(16, Color(0xFF181725)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
