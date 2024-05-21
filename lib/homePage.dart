import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Product.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: SvgPicture.asset('assets/vector/sidebar.svg'),
          onPressed: () {
            // Handle sidebar menu opening
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Deliver to', style: TextStyle(fontSize: 14)),
            Text('4102 Pretty View Lane', style: TextStyle(fontSize: 18)),
          ],
        ),
        actions: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/image/ProfilePhoto2.jpeg'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('What would you like to order', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Find food or restaurant...',
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
                  SizedBox(width: 0),
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
              Text('Top Categories', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryCard(title: 'Beverages', icon: 'assets/image/Beverages.png', onTap: () {
                      // Handle Beverages category tap
                    }),
                    CategoryCard(title: 'Snack', icon: 'assets/image/Snacks.png', onTap: () {
                      // Handle Snack category tap
                    }),
                    CategoryCard(title: 'Seafood', icon: 'assets/image/SeaFood.png', onTap: () {
                      // Handle Seafood category tap
                    }),
                    CategoryCard(title: 'Dessert', icon: 'assets/image/Desserts.png', onTap: () {
                      // Handle Dessert category tap
                    }),
                    CategoryCard(title: 'Fast Food', icon: 'assets/image/Burger.png', onTap: () {
                      Navigator.pushNamed(context,'browseMenu');
                    }),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Featured Restaurants', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () {
                      // Handle View All tap
                    },
                    child: Text('View All',
                    style:TextStyle(
                      color: Colors.red,
                    )

                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    RestaurantCard(
                      name: 'Texas Road House',
                      rating: 4.5,
                      deliveryTime: '10-15 mins',
                      freeDelivery: true,
                      icon: 'assets/image/TexasRoadHouse.png',
                      tags: ['Burger', 'Chicken', 'Fast Food'],
                      onTap: () {
                        // Handle restaurant card tap
                      },
                    ),
                    RestaurantCard(
                      name: 'Gin Yaki',
                      rating: 4.7,
                      deliveryTime: '10-15 mins',
                      freeDelivery: true,
                      icon: 'assets/image/GinYaki.png',
                      tags: ['Ramen', 'Chicken'],
                      onTap: () {
                        // Handle restaurant card tap
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Popular Items', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () {
                      // Handle View All tap
                    },
                    child: Text('View All',
                        style:TextStyle(
                          color: Colors.red,
                        )

                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                  child: Row(
                    children: [
                      PopularItemCard(
                        price: 5.50,
                        icon: 'assets/image/SmallPIzza.jpeg',
                        name: 'Salmon Salad',
                        description: 'Baked salmon fish',
                        rating: 4.5,
                        reviews: 25,
                      ),
                      SizedBox(width: 10),
                      PopularItemCard(
                        price: 5.50,
                        icon: 'assets/image/DoubleDecker.jpeg',
                        name: 'Salmon Salad',
                        description: 'Baked salmon fish',
                        rating: 4.5,
                        reviews: 25,
                      ),
                      SizedBox(width: 10),
                      PopularItemCard(
                        price: 5.50,
                        icon: 'assets/image/SmallPIzza.jpeg',
                        name: 'Salmon Salad',
                        description: 'Baked salmon fish',
                        rating: 4.5,
                        reviews: 25,
                      ),
                      SizedBox(width: 10),

                      PopularItemCard(
                        price: 5.50,
                        icon: 'assets/image/DoubleDecker.jpeg',
                        name: 'Salmon Salad',
                        description: 'Baked salmon fish',
                        rating: 4.5,
                        reviews: 25,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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

class CategoryCard extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;

  CategoryCard({required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            ClipOval(
              child: Container(
                color: Colors.grey[200],
                child: Image.asset(icon, height: 70, width: 70, fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 8),
            Text(title),
          ],
        ),
      ),
    );
  }
}

class RestaurantCard extends StatelessWidget {
  final String name;
  final double rating;
  final String deliveryTime;
  final bool freeDelivery;
  final String icon;
  final List<String> tags;
  final VoidCallback onTap;

  RestaurantCard({
    required this.name,
    required this.rating,
    required this.deliveryTime,
    required this.freeDelivery,
    required this.icon,
    required this.tags,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        child: Container(
          width: 300,
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
                    child: Image.asset(icon, height: 150, width: 300, fit: BoxFit.cover),
                  ),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow, size: 16),
                          SizedBox(width: 4),
                          Text('$rating', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(' (${rating.toInt()}+)', style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                      child: CircleAvatar(
                          backgroundColor: Colors.red,
                          child: Icon(Icons.favorite_sharp, color: Colors.white)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        if (freeDelivery)
                          Padding(
                            padding: const EdgeInsets.only(right: 4.0),
                            child: Text('Free delivery', style: TextStyle(color: Colors.green, fontSize: 12)),
                          ),
                        Text(deliveryTime, style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    Wrap(
                      spacing: 4.0,
                      children: tags.map((tag) => Chip(
                        label: Text(tag),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide.none,
                        ),
                      )).toList(),
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

class PopularItemCard extends StatelessWidget {
  final double price;
  final String icon;
  final String name;
  final String description;
  final double rating;
  final int reviews;

  PopularItemCard({
    required this.price,
    required this.icon,
    required this.name,
    required this.description,
    required this.rating,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0.1,
            blurRadius: 10,
            offset: Offset(5, 5), // changes position of shadow
          ),
        ],
      ),
      child: Card(
        color: Colors.white,
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
                  child: Image.asset(icon, height: 100, width: double.infinity, fit: BoxFit.cover),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 16),
                        SizedBox(width: 4),
                        Text('$rating', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(' ($reviews+)', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                      child: Icon(Icons.favorite_sharp, color: Colors.white)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('\$$price', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(description, style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }

}

