import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:foodapp_delivery/res/assets/app_images.dart';
import 'package:foodapp_delivery/res/theme/colors/app_colors.dart';
import 'package:foodapp_delivery/res/theme/fonts/app_fonts.dart';
import 'package:foodapp_delivery/widget/bassic_button.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int quantity = 1;
  bool isExpanded = false;
  bool isFavorite = false;
  final double basePrice = 4.99;

  @override
  Widget build(BuildContext context) {
    double totalPrice = basePrice * quantity; // Calculate total price

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.arrow_back),
                          Icon(Icons.share),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(16),
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppImages.RedApple_Image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // Product Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Naturel Red Apple",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Text("1kg, Price",
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : null,
                    ),
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (quantity > 1) quantity--;
                          });
                        },
                      ),
                      Text(quantity.toString(), style: TextStyle(fontSize: 16)),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(
                    "\$${totalPrice.toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            Divider(),

            ExpansionTile(
              title: Text("Product Detail"),
              initiallyExpanded: isExpanded,
              onExpansionChanged: (value) => setState(() => isExpanded = value),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Apples are nutritious. Apples may be good for weight loss. "
                    "Apples may be good for your heart. As part of a healthful and varied diet.",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                )
              ],
            ),

            // Nutritions
            ListTile(
              title: Text("Nutritions"),
              trailing: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text("100gr"),
              ),
            ),

            // Review
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    "Review",
                    style:
                        AppFonts.GilroyBasic600(16, AppColors.textColor_Black),
                  ),
                  Spacer(),
                  RatingBar(
                    filledIcon: Icons.star,
                    emptyIcon: Icons.star_border,
                    onRatingChanged: (value) => debugPrint('$value'),
                    initialRating: 3,
                    maxRating: 5,
                  ),
                ],
              ),
            ),

            Spacer(),

            // Add to Basket
            GestureDetector(
              onTap: () {},
              child: BassicButton(
                title: "Add to Basket",
              ),
            )
          ],
        ),
      ),
    );
  }
}
