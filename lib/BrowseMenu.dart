import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BrowseMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(100, 0, 0, 0),
                    child: Image.asset('assets/image/pizzacategory.png', width: double.infinity)),
                Positioned(
                  top: 30,
                  left: 0,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.red),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Positioned(
                    top: 150,
                    left: 0,
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 90.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Pizza',
                                  style: TextStyle(
                                      fontSize: 45,
                                      fontWeight: FontWeight.bold)),
                              Text('Fast Food',
                                  style: TextStyle(color: Colors.grey)),
                              SizedBox(height: 4),
                              Text('Total 4 results',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 19)),
                            ]))),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 90.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Find you favorite cuisine...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                        height: 90,
                        width: 90,
                        child: IconButton(
                          icon: SvgPicture.asset('assets/vector/filter.svg'),
                          onPressed: () {
                            // Handle filter action
                          },
                          padding: EdgeInsets.all(0), // Remove default padding
                          constraints: BoxConstraints(), // Remove default constraints
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Sort by:', style: TextStyle(fontSize: 16)),
                      DropdownButton<String>(
                        value: 'Popular',
                        items: <String>['Popular', 'Price', 'Rating'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          // Handle sort option change
                        },
                        style: TextStyle(color: Colors.red),
                        dropdownColor: Colors.white,
                        underline: Container(), // Remove underline
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  PizzaCard(
                    price: 10.35,
                    image: 'assets/image/ChickenHawaian.png',
                    name: 'Chicken Hawaiian',
                    restaurant: 'Cheezious',
                    description: 'Chicken, Cheese and pineapple',
                    rating: 4.5,
                    reviews: 25,
                    onTap: () {
                      Navigator.pushNamed(context, 'productPage');
                      // Handle card tap
                      print('Chicken Hawaiian tapped');
                    },
                  ),
                  PizzaCard(
                    price: 10.35,
                    image: 'assets/image/ChickenFajita.png',
                    name: 'Chicken Fajita',
                    restaurant: 'Pizza Hut',
                    description: 'Chicken, Cheese and mushroom',
                    rating: 4.5,
                    reviews: 25,
                    onTap: () {
                      // Handle card tap
                      print('Chicken Fajita tapped');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PizzaCard extends StatelessWidget {
  final double price;
  final String image;
  final String name;
  final String restaurant;
  final String description;
  final double rating;
  final int reviews;
  final VoidCallback onTap;

  PizzaCard({
    required this.price,
    required this.image,
    required this.name,
    required this.restaurant,
    required this.description,
    required this.rating,
    required this.reviews,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        onTap: onTap,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    child: Image.asset(image, height: 200, width: double.infinity, fit: BoxFit.cover),
                  ),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text('\$$price', style: TextStyle(fontWeight: FontWeight.bold)),
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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(restaurant, style: TextStyle(color: Colors.grey)),
                    SizedBox(height: 8),
                    Text(description),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 16),
                        SizedBox(width: 4),
                        Text('$rating', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(' ($reviews+)', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
