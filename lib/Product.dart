import 'package:flutter/material.dart';

import 'homePage.dart';


class ProductPage extends StatelessWidget {
  final Item item;
  ProductPage({required this.item});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    item.image,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: CircleAvatar(
                      backgroundColor: Colors.red,
                      child: Icon(Icons.favorite_sharp, color: Colors.white)),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              item.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 16),
                    SizedBox(width: 4),
                    Text(
                      '${item.rating}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 4),
                    Text('(${item.reviews})+', style: TextStyle(color: Colors.grey)),
                    SizedBox(width: 4),
                    Text('See Reviews', style: TextStyle(color: Colors.red)),
                  ],
                ),
                Text(item.restaurant, style: TextStyle(color: Colors.red)),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  '\$${item.price}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.remove, color: Colors.red),
                  onPressed: () {
                    // Decrease quantity logic
                  },
                ),
                Text('01', style: TextStyle(fontSize: 16)),
                IconButton(
                  icon: Icon(Icons.add, color: Colors.red),
                  onPressed: () {
                    // Increase quantity logic
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Indulge in a tropical twist with our Chicken Hawaiian Pizza! Savor the perfect combination of juicy chicken, sweet pineapple, and savory ham, all nestled on a bed of gooey mozzarella cheese. See Nutritional Facts',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 16),
            Text(
              'Choice of Add On',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            AddOnOption(
              name: 'Pepper Julienned',
              price: 2.30,
              groupValue: 'Pepper Julienned',
            ),
            AddOnOption(
              name: 'Baby Spinach',
              price: 4.70,
              groupValue: 'Pepper Julienned',
            ),
            AddOnOption(
              name: 'Mushroom',
              price: 2.50,
              groupValue: 'Pepper Julienned',
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/cartPage');
                },
                icon: Icon(Icons.shopping_cart, color: Colors.white),
                label: Text('Add to cart', style: TextStyle(fontSize: 16, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddOnOption extends StatelessWidget {
  final String name;
  final double price;
  final String groupValue;

  AddOnOption({
    required this.name,
    required this.price,
    required this.groupValue,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<String>(
          value: name,
          groupValue: groupValue,
          onChanged: (String? value) {
            // Handle radio button selection
          },
          activeColor: Colors.red,
        ),
        Expanded(
          child: Text(name, style: TextStyle(fontSize: 16)),
        ),
        Text('\$$price', style: TextStyle(fontSize: 16, color: Colors.grey)),
      ],
    );
  }
}
