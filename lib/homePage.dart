import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/popularItem.dart';
import 'package:flutter_app/restaurantCard.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'BrowseMenu.dart';
import 'Product.dart';
import 'category.dart';
import 'navigationbar.dart';

class HomePage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final List<Category> categories = [
    Category(
      title: 'Beverages',
      thumbnail:'assets/image/beveragecategory.png',
      icon: 'assets/image/Beverages.png',
      items: [
      ],
    ),
    Category(
      title: 'Snack',
      thumbnail: 'assets/image/Snackcategory.png',
      icon: 'assets/image/Snacks.png',
      items: [
      ],
    ),
    Category(
      title: 'SeaFood',
      thumbnail: 'assets/image/SeaFoodCategory.png',
      icon: 'assets/image/SeaFood.png',
      items: [
      ],
    ),
    Category(
      title: 'Dessert',
      thumbnail: 'assets/image/DessertCategory.png',
      icon: 'assets/image/Desserts.png',
      items: [

      ],
    ),
    Category(
      title: 'Fast Food',
      thumbnail: 'assets/image/pizzacategory2.png',
      icon: 'assets/image/Burger.png',
      items: [
        Item(
          name:'Chicken Hawaiian',
          image:'assets/image/ChickenHawaian.png',
          price:10.35,
          restaurant: 'Cheezious',
          detailedDescription: 'Indulge in a tropical twist with our Chicken Hawaiian Pizza! Savor the perfect combination of juicy chicken, sweet pineapple, and savory ham, all nestled on a bed of gooey mozzarella cheese. See Nutritional Facts',
          description: 'Chicken, Cheese and pineapple',
          rating: 4.5,
          reviews: 25,
        ),
        Item(
          price: 10.35,
          image: 'assets/image/ChickenFajita.png',
          name: 'Chicken Fajita',
          restaurant: 'Pizza Hut',
          detailedDescription: 'Indulge in a tropical twist with our Chicken Fajita Pizza! Savor the perfect combination of juicy chicken, sweet pineapple, and savory ham, all nestled on a bed of gooey mozzarella cheese. See Nutritional Facts',
          description: 'Chicken, Cheese and mushroom',
          rating: 4.5,
          reviews: 25,
        )


      ],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: IconButton(
          icon: SvgPicture.asset('assets/vector/sidebar.svg'),
          onPressed: () {
           print(_auth.currentUser!.uid);
          },
        ),
        title: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Text('Deliver to',
                    style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400)),
                    Icon(Icons.arrow_drop_down)
                  ]
              ),
              Text('4102 Pretty View Lane', style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400)),
            ],
          ),
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
              Text('What would you like to order', style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
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
                  children: categories.map((category) {
                    return CategoryCard(
                      title: category.title,
                      icon: category.icon,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BrowseMenu(category: category),
                          ),
                        );
                      },
                    );
                  }).toList(),
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


class Category {
  final String title;
  final String thumbnail;
  final String icon;
  final List<Item> items;

  Category({
    required this.thumbnail,
    required this.title,
    required this.icon,
    required this.items,
  });
}

class Item {
  final String name;
  final String image;
  final double price;
  final String restaurant;
  final String description;
  final String detailedDescription;
  final double rating;
  final int reviews;

  Item({
    required this.name,
    required this.detailedDescription,
    required this.image,
    required this.price,
    required this.restaurant,
    required this.description,
    required this.rating,
    required this.reviews,
  });
}



