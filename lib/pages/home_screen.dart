import 'package:flutter/material.dart';
import 'package:foodapp_delivery/res/assets/app_images.dart';
import 'package:foodapp_delivery/res/theme/colors/app_colors.dart';
import 'package:foodapp_delivery/res/theme/fonts/app_fonts.dart';
import 'package:foodapp_delivery/screen/account_screen.dart';
import 'package:foodapp_delivery/screen/cart_screen.dart';
import 'package:foodapp_delivery/screen/explore_screen.dart';
import 'package:foodapp_delivery/screen/favorite_screen.dart';
import 'package:foodapp_delivery/widget/bassic_widget.dart';
import 'package:foodapp_delivery/widget/groceries_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> tabScreens = [
    const HomeScreenContent(),
    const ExploreScreen(),
    const CartScreen(),
    const FavoriteScreen(),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabScreens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: AppColors.primary_Color,
        unselectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          _buildBottomNavItem(AppImages.store_Icon, "Shop", 0),
          _buildBottomNavItem(AppImages.explore_Icon, "Explore", 1),
          _buildBottomNavItem(AppImages.cart_Icon, "Cart", 2),
          _buildBottomNavItem(AppImages.favorite_Icon, "Favourite", 3),
          _buildBottomNavItem(AppImages.account_Icon, "Account", 4),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavItem(
      String iconPath, String label, int index) {
    return BottomNavigationBarItem(
      icon: ColorFiltered(
        colorFilter: ColorFilter.mode(
          _currentIndex == index ? AppColors.primary_Color : Colors.black,
          BlendMode.srcIn,
        ),
        child: Image.asset(iconPath, width: 24, height: 24),
      ),
      label: label,
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child:
                    Image.asset(AppImages.CarrotImage, height: 24, width: 24)),
            const SizedBox(height: 8),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.location_pin),
                  Text(
                    "Dhaka, Banassre",
                    style:
                        AppFonts.GilroyBasic600(18, AppColors.textColor_Black),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            _buildSearchBar(),
            const SizedBox(height: 16),
            _buildBanner(),
            const SizedBox(height: 16),
            _buildSection("Exclusive Offer"),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: BassicWidget(
                      title: "Organic Bananas",
                      information: "7pcs, Priceg",
                      price: "\$4.99",
                      imageProduct:
                          Image(image: AssetImage(AppImages.Banana_Image)),
                      onTap: () {},
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: BassicWidget(
                      title: "Red Apple",
                      information: "1kg, Priceg",
                      price: "\$4.99",
                      imageProduct: Image(
                        image: AssetImage(AppImages.RedApple_Image),
                        height: 70,
                      ),
                      onTap: () {},
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: BassicWidget(
                      title: "Organic Ginger",
                      information: "1kg, Priceg",
                      price: "\$4.99",
                      imageProduct:
                          Image(image: AssetImage(AppImages.GingerImage)),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
            _buildSection("Best Selling"),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: BassicWidget(
                      title: "Organic Pepper",
                      information: "7pcs, Priceg",
                      price: "\$4.99",
                      imageProduct:
                          Image(image: AssetImage(AppImages.Bell_Pepper)),
                      onTap: () {},
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: BassicWidget(
                      title: "Red Apple",
                      information: "1kg, Priceg",
                      price: "\$4.99",
                      imageProduct: Image(
                        image: AssetImage(AppImages.GingerImage),
                      ),
                      onTap: () {},
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: BassicWidget(
                      title: "Eggs",
                      information: "8pcs, Priceg",
                      price: "\$4.99",
                      imageProduct: Image(
                        image: AssetImage(AppImages.EggsImage),
                        height: 75,
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
            _buildSection("Groceries"),
            //Groceries List
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GroceriesWidget(
                    title: "Pulses",
                    imageSection:
                        Image(image: AssetImage(AppImages.image_geo1)),
                  ),
                  GroceriesWidget(
                    title: "Pulses",
                    imageSection:
                        Image(image: AssetImage(AppImages.image_geo2)),
                    colorData: Color(0XFF53B175),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //Product List
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: BassicWidget(
                      title: "Beef Bone",
                      information: "1kg, Priceg",
                      price: "\$4.99",
                      imageProduct:
                          Image(image: AssetImage(AppImages.MeetImage)),
                      onTap: () {},
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: BassicWidget(
                      title: "Broiler Chicken",
                      information: "1kg, Priceg",
                      price: "\$4.99",
                      imageProduct: Image(image: AssetImage(AppImages.chicken)),
                      onTap: () {},
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: BassicWidget(
                      title: "Beef Bone",
                      information: "1kg, Priceg",
                      price: "\$4.99",
                      imageProduct:
                          Image(image: AssetImage(AppImages.MeetImage)),
                      onTap: () {},
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

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0XFFF2F3F2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.grey),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Search Store",
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBanner() {
    return SizedBox(
      width: double.infinity,
      child: Image.asset(AppImages.banner, fit: BoxFit.cover),
    );
  }

  Widget _buildSection(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppFonts.GilroyBasic600(24, AppColors.textColor_Black),
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              "See all",
              style: AppFonts.GilroyBasic600(16, AppColors.primary_Color),
            ),
          ),
        ],
      ),
    );
  }
}
