import 'package:flutter/material.dart';
import 'homePage.dart';
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
          icon: GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/homePage');
              },
              child: Icon(Icons.home)),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/orders');
              },
              child: Icon(Icons.menu_book)),
          label: 'Orders',
        ),
        BottomNavigationBarItem(
          icon: Stack(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/cartPage');
                  },
                  child: Icon(Icons.shopping_bag)),
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
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/favorites');
              },
              child: Icon(Icons.favorite)),
          label: 'Favorite',
        ),
        BottomNavigationBarItem(
          icon: Stack(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/notifications');
                  },
                  child: Icon(Icons.notifications)),
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
          label: 'Notification',
        ),
      ],
      selectedItemColor: selectedItemColor,
      unselectedItemColor: unselectedItemColor,
    );
  }
}
