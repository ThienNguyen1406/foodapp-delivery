import 'package:flutter/material.dart';
import 'package:foodapp_delivery/res/assets/app_images.dart';
import 'package:foodapp_delivery/res/theme/colors/app_colors.dart';
import 'package:foodapp_delivery/res/theme/fonts/app_fonts.dart';
import 'package:foodapp_delivery/router/app_router.dart';
import 'package:foodapp_delivery/widget/bassic_button.dart';

class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({super.key});

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  String? selectedZone = 'Banasree';
  String? selectedArea;

  List<String> zones = ['Banasree', 'VietNam', 'Japan'];
  List<String> areas = ['Area 1', 'Area 2', 'Area 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    padding: EdgeInsets.only(bottom: 32),
                    child: Image(image: AssetImage(AppImages.goBack))),
              ),
              Center(
                child: Image(
                  image: AssetImage(AppImages.LocationImage),
                  height: 170,
                  width: 224,
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Text(
                    "Select Your Location",
                    style:
                        AppFonts.GilroyBasic600(26, AppColors.textColor_Black),
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  child: Text(
                    "Swithch on your location to stay in tune with what’s happening in your area",
                    style: AppFonts.GilroyMedium400(16, AppColors.greyText),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 64),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Dropdown Zone
                    Text("Your Zone", style: TextStyle(color: Colors.grey)),
                    DropdownButtonFormField<String>(
                      value: selectedZone,
                      items: zones.map((zone) {
                        return DropdownMenuItem<String>(
                          value: zone,
                          child: Text(zone),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedZone = value;
                        });
                      },
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(vertical: 8),
                      ),
                    ),

                    SizedBox(height: 24),

                    // Dropdown Area
                    Text("Your Area", style: TextStyle(color: Colors.grey)),
                    DropdownButtonFormField<String>(
                      value: selectedArea,
                      hint: Text(
                        'Types of your area',
                        style: TextStyle(color: Colors.grey),
                      ),
                      items: areas.map((area) {
                        return DropdownMenuItem<String>(
                          value: area,
                          child: Text(area),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedArea = value;
                        });
                      },
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(vertical: 8),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.pushNamed(context, AppRouter.loginScreen);
                  });
                },
                child: BassicButton(title: "Submit"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
