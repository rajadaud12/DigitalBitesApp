import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
