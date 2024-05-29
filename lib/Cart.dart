import 'package:flutter/material.dart';

import 'Product.dart';
import 'navigationbar.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () {
            Navigator.pushReplacementNamed(context,'/homePage');
          },
        ),
        title: Text('Cart', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CartItem(
              imageUrl: 'assets/image/ChickenHawaian.png',
              name: 'Chicken Hawaiian',
              description: 'Chicken, Cheese and pineapple',
              price: 15.30,
              quantity: 2,
            ),
            CartItem(
              imageUrl: 'assets/image/ChickenHawaian.png',
              name: 'Greek salad',
              description: 'with baked salmon',
              price: 12.00,
              quantity: 2,
            ),
            Divider(),
            CartSummary(),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width:150,
                  height:50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/ checkout');
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16), backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text('CHECKOUT', style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ),
                Container(
                  width:150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Dine in logic
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16), backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text('DINE IN', style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        cartNotifications: 2,
        bellNotifications: 6,
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String description;
  final double price;
  final int quantity;

  CartItem({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imageUrl,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(description, style: TextStyle(color: Colors.grey)),
              Text('\$$price USD', style: TextStyle(fontSize: 16, color: Colors.black)),
            ],
          ),
        ),
        SizedBox(width: 16),
        Column(
          children: [
            IconButton(
              icon: Icon(Icons.add_circle_outline, color: Colors.red),
              onPressed: () {
                // Increase quantity logic
              },
            ),
            Text('$quantity', style: TextStyle(fontSize: 16)),
            IconButton(
              icon: Icon(Icons.remove_circle_outline, color: Colors.red),
              onPressed: () {
                // Decrease quantity logic
              },
            ),
          ],
        ),
      ],
    );
  }
}

class CartSummary extends StatelessWidget {
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
