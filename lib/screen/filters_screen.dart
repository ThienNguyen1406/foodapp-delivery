import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodapp_delivery/res/theme/colors/app_colors.dart';
import 'package:foodapp_delivery/res/theme/fonts/app_fonts.dart';
import 'package:foodapp_delivery/screen/beverages_screen.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  Map<String, bool> categories = {
    "Eggs": false,
    "Noodles & Pasta": false,
    "Chips & Crisps": false,
    "Fast Food": false,
  };

  Map<String, bool> brands = {
    "Individual Collection": false,
    "Cocola": false,
    "Ifad": false,
    "Kazi Farmas": false,
  };
  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(FontAwesomeIcons.xmark, size: 24)),
                  Expanded(
                    child: Text(
                      "Filters",
                      style:
                          AppFonts.GilroyBold400(20, AppColors.textColor_Black),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Text("Categories",
                  style:
                      AppFonts.GilroyBasic600(24, AppColors.textColor_Black)),
              ...categories.keys.map((key) => CheckboxListTile(
                    title: Text(key,
                        style: TextStyle(
                            color:
                                categories[key]! ? Colors.green : Colors.black,
                            fontWeight: FontWeight.w400,
                            fontFamily: AppFonts.Gilroy_Medium)),
                    activeColor: Colors.green,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: categories[key],
                    onChanged: (value) {
                      setState(() {
                        categories[key] = value!;
                      });
                    },
                  )),
              const SizedBox(height: 10),
              Text("Categories",
                  style:
                      AppFonts.GilroyBasic600(24, AppColors.textColor_Black)),
              ...brands.keys.map((key) => CheckboxListTile(
                    title: Text(key,
                        style: TextStyle(
                            color: brands[key]! ? Colors.green : Colors.black,
                            fontWeight: FontWeight.w400,
                            fontFamily: AppFonts.Gilroy_Medium)),
                    activeColor: Colors.green,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: brands[key],
                    onChanged: (value) {
                      setState(() {
                        brands[key] = value!;
                      });
                    },
                  )),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BeveragesScreen(
                        selectedCategories: categories,
                        selectedBrands: brands,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19),
                      color: AppColors.primary_Color,
                    ),
                    child: Text(
                      "Apply Filter",
                      style: AppFonts.GilroyBasic600(18, AppColors.white_Color),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
