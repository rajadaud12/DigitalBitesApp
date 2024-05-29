import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Product.dart';
import 'foodCard.dart';
import 'homePage.dart';
import 'navigationbar.dart';

class BrowseMenu extends StatelessWidget {
  final Category category;

  BrowseMenu({required this.category});

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
                    padding: category.title=='Fast Food'?EdgeInsets.fromLTRB(145, 0, 0, 0):EdgeInsets.fromLTRB(100, 0, 0, 0),
                    child: Image.asset(category.thumbnail, width: double.infinity)),
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

              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 90.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(category.title,
                                style: GoogleFonts.poppins(
                                    fontSize: 45,
                                    fontWeight: FontWeight.bold)),
                            Text(category.title,
                                style: GoogleFonts.poppins(color: Colors.grey)),
                            SizedBox(height: 15),
                            Text('Total ${category.items.length} results',
                                style: GoogleFonts.poppins(
                                    color: Colors.grey, fontSize: 19)),
                          ])),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Find your favorite cuisine...',
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
                      Text('Sort by:', style: GoogleFonts.poppins(fontSize: 16)),
                      DropdownButton<String>(
                        value: 'Popular',
                        items: <String>['Popular', 'Price', 'Rating'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: GoogleFonts.poppins()),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          // Handle sort option change
                        },
                        style: GoogleFonts.poppins(color: Colors.red),
                        dropdownColor: Colors.white,
                        underline: Container(), // Remove underline
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  ...category.items.map((item) {
                    return FoodCard(
                      price: item.price,
                      image: item.image,
                      name: item.name,
                      restaurant: item.restaurant,
                      description: item.description,
                      rating: item.rating,
                      reviews: item.reviews,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductPage(item: item),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ],
              ),
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


class Product{
  final String name;
  final String image;
  final double price;
  final String restaurant;
  final String description;
  final double rating;
  final int reviews;

  Product({
    required this.name,
    required this.image,
    required this.price,
    required this.restaurant,
    required this.description,
    required this.rating,
    required this.reviews,
  });
}