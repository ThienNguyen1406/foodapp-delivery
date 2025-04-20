import 'package:flutter/material.dart';
import 'package:foodapp_delivery/widget/custom_bottom_sheet.dart';

class Common {
  static void showCustomBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => CustomBottomSheet(),
  );
}
}