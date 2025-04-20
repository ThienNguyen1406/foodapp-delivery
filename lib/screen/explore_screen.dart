import 'package:flutter/material.dart';
import 'package:foodapp_delivery/res/assets/app_images.dart';
import 'package:foodapp_delivery/res/theme/fonts/app_fonts.dart';
import 'package:foodapp_delivery/router/app_router.dart';
import 'package:foodapp_delivery/widget/basic_widget_find.dart';


class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Text(
                  "Find Products",
                  style: AppFonts.GilroyBold400(20, Colors.black),
                ),
              ),
              Container(
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
                        controller: searchController,
                        decoration: const InputDecoration(
                          hintText: "Search Store",
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Expanded(
                flex: 6,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, AppRouter.beverages);
                                  },
                                  child: BasicWidgetFind())),
                          Expanded(
                              child: BasicWidgetFind(
                            title: "Cooking Oil & Ghee",
                            imageProduct: Image(
                              image: AssetImage(AppImages.anh2),
                            ),
                            backgroundColor: Color(0XFFF8A44C),
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: BasicWidgetFind(
                            title: "Meet & Fish",
                            imageProduct: Image(
                              image: AssetImage(AppImages.anh3),
                            ),
                            backgroundColor: Color(0XFFF7A593),
                          )),
                          Expanded(
                              child: BasicWidgetFind(
                            title: "Bakery & Snacks",
                            imageProduct: Image(
                              image: AssetImage(AppImages.anh4),
                            ),
                            backgroundColor: Color(0XFFD4B0E0),
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: BasicWidgetFind(
                            title: "Cooking Oil & Ghee",
                            imageProduct: Image(
                              image: AssetImage(AppImages.anh5),
                            ),
                            backgroundColor: Color(0XFFFDE598),
                          )),
                          Expanded(
                              child: BasicWidgetFind(
                            title: "Cooking Oil & Ghee",
                            imageProduct: Image(
                              image: AssetImage(AppImages.anh6),
                            ),
                            backgroundColor: Color(0XFFb7DFF5),
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: BasicWidgetFind(
                            title: "Bakery & Snacks",
                            imageProduct: Image(
                              image: AssetImage(AppImages.anh4),
                            ),
                            backgroundColor: Color(0XFFD4B0E0),
                          )),
                          Expanded(
                              child: BasicWidgetFind(
                            title: "Cooking Oil & Ghee",
                            imageProduct: Image(
                              image: AssetImage(AppImages.anh6),
                            ),
                            backgroundColor: Color(0XFFb7DFF5),
                          )),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
