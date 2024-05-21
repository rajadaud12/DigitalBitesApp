import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final int cartNotifications;
  final int bellNotifications;

  CustomBottomNavigationBar({
    required this.selectedItemColor,
    required this.unselectedItemColor,
    this.cartNotifications = 0,
    this.bellNotifications = 0,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Stack(
            children: [
              Icon(Icons.shopping_bag),
              if (cartNotifications > 0)
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: Text(
                      '$cartNotifications',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Stack(
            children: [
              Icon(Icons.notifications),
              if (bellNotifications > 0)
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: Text(
                      '$bellNotifications',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
          label: '',
        ),
      ],
      selectedItemColor: selectedItemColor,
      unselectedItemColor: unselectedItemColor,
    );
  }
}

class ProductPage extends StatelessWidget {
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
                    'assets/image/ChickenHawaian.png',
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
              'Chicken Hawaiian',
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
                      '4.5',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 4),
                    Text('(30+)', style: TextStyle(color: Colors.grey)),
                    SizedBox(width: 4),
                    Text('See Reviews', style: TextStyle(color: Colors.red)),
                  ],
                ),
                Text('Cheezious', style: TextStyle(color: Colors.red)),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  '\$9.50',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
                ),
                SizedBox(width: 201),
                IconButton(
                  icon: Icon(Icons.remove, color: Colors.red),
                  onPressed: () {
                    // Decrease quantity logic
                  },
                ),
                Text('02', style: TextStyle(fontSize: 16)),
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
              name: 'Masroom',
              price: 2.50,
              groupValue: 'Pepper Julienned',
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context,'cartPage');
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

