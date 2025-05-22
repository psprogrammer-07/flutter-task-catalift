import 'package:flutter/material.dart';
import 'package:flutter_task_catalift/widgets/mentors_tab_bar.dart'; // Import the MentorsTabBar
import 'package:flutter_task_catalift/widgets/search_bar_widget.dart'; // Import the SearchBarWidget
import 'package:flutter_task_catalift/widgets/mentor_card_widget.dart'; // Import the MentorCardWidget

class MentorsScreen extends StatefulWidget {
  const MentorsScreen({super.key});

  @override
  State<MentorsScreen> createState() => _MentorsScreenState();
}

class _MentorsScreenState extends State<MentorsScreen> with SingleTickerProviderStateMixin {
  int _bottomNavSelectedIndex = 1; // Default to 'Explore Mentors' for bottom nav
  late TabController _tabController;
  String _searchQuery = ''; // Add state variable for search query

  // Define the colors from the image
  static const Color primaryColor = Color(0xFF0A004A); // Dark blue
  static const Color accentColor = Color(0xFFF0F0F0); // Light grey for background
  static const Color inactiveTabColor = Colors.grey; // For inactive tabs

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 1); // Default to 'Explore' tab
    _tabController.addListener(() {
      // Optional: if you need to react to tab changes programmatically
      // setState(() {}); // To rebuild if needed, e.g. for conditional UI based on tab
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onBottomNavItemTapped(int index) {
    setState(() {
      _bottomNavSelectedIndex = index;
    });
    // Handle navigation for bottom bar items if necessary
    // For now, it just updates the selected index
  }

  // Dummy data for mentor list
  final List<Map<String, dynamic>> _dummyMentors = [
    {
      'imagepath': 'assets/images/pro_pic.png',
      'name': 'Gaurav Samant',
      'rating': 4.9,
      'sector': 'IT Sector',
      'experience': '4 years',
      'reviews': '175 Reviews',
      'description': 'Strategy Manager @CEO Office | Ex-eBay & L&T | MDI Gurgaon . ESCP Europe | 32+ National Case Comps Podiums',
      'compatibility': 98,
    },
    {
      'imagepath': 'assets/images/pro_pic.png',
      'name': 'Ramesh Kumar',
      'rating': 4.9,
      'sector': 'IT Sector',
      'experience': '4 years',
      'reviews': '175 Reviews',
      'description': 'Strategy Manager @CEO Office | Ex-eBay & L&T | MDI Gurgaon . ESCP Europe | 32+ National Case Comps Podiums',
      'compatibility': 82,
    },
    {
      'imagepath': 'assets/images/pro_pic.png',
      'name': 'Another Mentor',
      'rating': 4.7,
      'sector': 'Finance',
      'experience': '6 years',
      'reviews': '120 Reviews',
      'description': 'Senior Financial Analyst | CFA Charterholder | Experienced in M&A and Equity Research.',
      'compatibility': 75,
    },
  ];

  Widget _buildExploreMentorsList() {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 8.0), // Add some padding above the list
      itemCount: _dummyMentors.length,
      itemBuilder: (context, index) {
        final mentor = _dummyMentors[index];
        return MentorCardWidget(
          imagepath: mentor['imagepath'],
          name: mentor['name'],
          rating: mentor['rating'],
          sector: mentor['sector'],
          experience: mentor['experience'],
          reviews: mentor['reviews'],
          description: mentor['description'],
          compatibility: mentor['compatibility'],
        );
      },
    );
  }

  void _onMentorTabChanged(int index) {
    // This callback is from MentorsTabBar, can be used if needed
    // For now, TabController handles the state
  }

  void _updateSearchQuery(String newQuery) {
    setState(() {
      _searchQuery = newQuery;
    });
  }

  Widget _buildMentorList() {
    // Filter the dummy mentors based on the search query
    final filteredMentors = _dummyMentors.where((mentor) {
      final nameLower = mentor['name'].toLowerCase();
      final sectorLower = mentor['sector'].toLowerCase();
      final queryLower = _searchQuery.toLowerCase();
      return nameLower.contains(queryLower) || sectorLower.contains(queryLower);
    }).toList();

    return ListView.builder(
      padding: const EdgeInsets.only(top: 8.0), // Add some padding above the list
      itemCount: filteredMentors.length,
      itemBuilder: (context, index) {
        final mentor = filteredMentors[index];
        return MentorCardWidget(
          imagepath: mentor['imagepath'],
          name: mentor['name'],
          rating: mentor['rating'],
          sector: mentor['sector'],
          experience: mentor['experience'],
          reviews: mentor['reviews'],
          description: mentor['description'],
          compatibility: mentor['compatibility'],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor is handled by ThemeData
        // elevation is handled by ThemeData
        title: const Text('CATALIFT'), // Style from ThemeData
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline), // Color from ThemeData
            onPressed: () {
              // TODO: Implement profile action
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none), // Color from ThemeData
            onPressed: () {
              // TODO: Implement notifications action
            },
          ),
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline), // Color from ThemeData
            onPressed: () {
              // TODO: Implement chat action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: Text(
              'Mentors',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: primaryColor, // Using the primary color for the title
              ),
            ),
          ),
          MentorsTabBar(
            tabController: _tabController,
            onTabChanged: _onMentorTabChanged,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Content for 'My Mentors' Tab
                Container(
                  color: accentColor,
                  child: const Center(child: Text('My Mentors Content')),
                ),
                // Content for 'Explore' Tab
                Container(
                  color: accentColor,
                  child: Column(
                    children: [
                      SearchBarWidget(onChanged: _updateSearchQuery), // Connect SearchBarWidget to filtering
                      Expanded(
                        child: _buildMentorList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            activeIcon: Icon(Icons.explore),
            label: 'Explore Mentors',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            activeIcon: Icon(Icons.menu_book),
            label: 'Courses',
          ),
        ],
        currentIndex: _bottomNavSelectedIndex,
        // selectedItemColor, unselectedItemColor, etc. are handled by ThemeData
        onTap: _onBottomNavItemTapped,
      ),
    );
  }
}