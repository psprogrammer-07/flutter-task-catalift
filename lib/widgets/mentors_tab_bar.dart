import 'package:flutter/material.dart';

class MentorsTabBar extends StatefulWidget {
  final TabController tabController;
  final Function(int) onTabChanged;

  const MentorsTabBar({
    super.key,
    required this.tabController,
    required this.onTabChanged,
  });

  @override
  State<MentorsTabBar> createState() => _MentorsTabBarState();
}

class _MentorsTabBarState extends State<MentorsTabBar> {
  static const Color primaryColor = Color(0xFF0A004A); // Dark blue
  static const Color inactiveTabColor = Colors.grey;
  static const Color activeTabBackgroundColor = primaryColor;
  static const Color inactiveTabBackgroundColor = Color(0xFFE0E0E0); // Light grey for inactive tab

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      height: 40,
      decoration: BoxDecoration(
        color: inactiveTabBackgroundColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: TabBar(
        controller: widget.tabController,
        onTap: widget.onTabChanged,
        indicator: BoxDecoration(
          
          borderRadius: BorderRadius.circular(20.0),
          color: activeTabBackgroundColor,
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: Colors.white,
        unselectedLabelColor: inactiveTabColor,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
        tabs: const [
          Tab(text: 'My Mentors'),
          Tab(text: 'Explore'),
        ],
      ),
    );
  }
}