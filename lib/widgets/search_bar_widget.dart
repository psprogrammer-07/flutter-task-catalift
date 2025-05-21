import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  static const Color accentColor = Color(0xFFF0F0F0); // Light grey for background
  static const Color hintTextColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(color: hintTextColor),
          prefixIcon: Icon(Icons.search, color: hintTextColor),
          filled: true,
          fillColor: Colors.white, // Search bar background
          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide.none, // No border as per the image
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1.5),
          ),
        ),
        onChanged: (value) {
          // TODO: Implement search functionality
        },
      ),
    );
  }
}