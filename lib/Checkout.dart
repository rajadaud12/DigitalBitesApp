import 'package:flutter/material.dart';
import 'package:flutter_app/SuccessPopup.dart';

class Checkout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Order', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/image/location.png',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.location_on, color: Colors.red),
              title: Text('NYC, Broadway St.', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('030506951'),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.red),
              onTap: () {
                // Navigate to address selection page
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.payment, color: Colors.red),
              title: Text('MasterCard', style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.red),
              onTap: () {
                // Navigate to payment selection page
              },
            ),
            Divider(),
            SizedBox(height: 16),
            OrderSummary(),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                showOrderSuccessDialog(context);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16), backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text('CONFIRM ORDER', style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SummaryRow(label: 'Subtotal', amount: 27.30),
        SummaryRow(label: 'Tax and Fees', amount: 5.30),
        SummaryRow(label: 'Delivery', amount: 1.00),
        Divider(),
        SummaryRow(label: 'Total (2 items)', amount: 33.60, isTotal: true),
      ],
    );
  }
}

class SummaryRow extends StatelessWidget {
  final String label;
  final double amount;
  final bool isTotal;

  SummaryRow({
    required this.label,
    required this.amount,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 18 : 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? Colors.black : Colors.grey,
            ),
          ),
          Text(
            '\$$amount USD',
            style: TextStyle(
              fontSize: isTotal ? 18 : 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? Colors.black : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
