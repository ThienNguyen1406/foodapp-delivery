import 'package:flutter/material.dart';
import 'package:foodapp_delivery/res/theme/colors/app_colors.dart';



class Dropdown extends StatelessWidget {
  final String title;
  final String placeholder;
  final List valueList;
  final String? titleKey;
  final Object? selectValue;
  final Function(Object?) didChange;
  const Dropdown(
      {super.key,
      required this.title,
      required this.placeholder,
      required this.valueList,
      this.titleKey,
      this.selectValue,
      required this.didChange});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: TextStyle(
              color: AppColors.greyText,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 55,
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
                onChanged: didChange,
                icon: Icon(
                  Icons.expand_more,
                  color:AppColors.textColor_Black,
                ),
                value: selectValue,
                hint: Text(
                  placeholder,
                  style: TextStyle(
                      color: AppColors.textColor_Black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                isExpanded: true,
                items: valueList.map((obj) {
                  return DropdownMenuItem(
                      value: obj,
                      child: Text(
                        titleKey != null ? ( obj[titleKey] ).toString() : obj.toString(),
                        style: TextStyle(
                            color: AppColors.textColor_Black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ));
                }).toList()),
          ),
        ),
        Container(
          width: double.maxFinite,
          height: 1,
          color: const Color(0xffE2E2E2),
        )
      ],
    );
  }
}
