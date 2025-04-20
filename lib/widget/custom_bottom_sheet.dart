import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Checkout',
                  style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          // Divider(),
          Container(
            height: 1,
            color: Colors.grey,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  buildListItem(
                      'Delivery', 'Select Method', Icons.local_shipping),
                  buildListItem('Payment', '', Icons.payment,
                      trailingIcon: Icon(Icons.credit_card, color: Colors.blue)),
                  buildListItem(
                      'Promo Code', 'Pick discount', Icons.card_giftcard),
                  buildListItem('Total Cost', '\$13.97', Icons.attach_money,
                      showArrow: false),
                ],
              ),
            ),
          ),
          // SizedBox(height: 16),
          Text('By placing an order you agree to our Terms And Conditions',
              style: TextStyle(fontSize: 12, color: Colors.grey)),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
              ),
              onPressed: () {},
              child: Text('Place Order',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListItem(String title, String subtitle, IconData icon,
      {bool showArrow = true, Widget? trailingIcon}) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.grey),
          title: Text(title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          subtitle: subtitle.isNotEmpty
              ? Text(subtitle, style: TextStyle(color: Colors.grey))
              : null,
          trailing: trailingIcon ??
              (showArrow
                  ? Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey)
                  : null),
        ),
        Divider(),
      ],
    );
  }
}
