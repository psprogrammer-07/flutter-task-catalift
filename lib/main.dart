import 'package:flutter/material.dart';
import 'package:flutter_task_catalift/screens/mentors_screen.dart'; // Import the MentorsScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catalift',
      theme: ThemeData(
        // Using the primary color from MentorsScreen for consistency
        primaryColor: const Color(0xFF0A004A),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0A004A), // Dark blue from the design
          background: const Color(0xFFF0F0F0), // Light grey background
        ),
        scaffoldBackgroundColor: const Color(0xFFF0F0F0), // Light grey background for scaffolds
        fontFamily: 'Roboto', // A common, clean font. Can be changed if a specific one is needed.
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0A004A),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Color(0xFF0A004A),
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false, // Remove debug banner
      home: const MentorsScreen(), // Set MentorsScreen as the home screen
    );
  }
}
