import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
void showOrderSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/partying_face_1.gif',
              height: 100,
            ),
            SizedBox(height: 16),
            Text(
              'Ordered successfully',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Your order has been successfully placed. You can track your order status below',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.pop(context); // Close the dialog
                // Navigate to order tracking page
              },
              child: Text(
                'Track Order',
                style: TextStyle(fontSize: 16, color: Colors.red, decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      );
    },
  );
}
