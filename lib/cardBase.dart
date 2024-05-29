import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class CardBase extends StatelessWidget {
  final String icon;
  final String name;
  final double rating;
  final VoidCallback onTap;

  CardBase({
    required this.icon,
    required this.name,
    required this.rating,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context);
}
