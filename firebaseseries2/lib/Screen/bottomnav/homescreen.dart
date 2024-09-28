import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebaseseries2/Screen/bottomnav/HomePage.dart';
import 'package:firebaseseries2/Screen/bottomnav/Medaltracker.dart';
import 'package:firebaseseries2/Screen/bottomnav/Records.dart';
import 'package:firebaseseries2/Screen/bottomnav/Stories.dart';
import 'package:firebaseseries2/utils/app_color.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _currentIndex = 0; // Track the selected tab index

  final List<Widget> screens = [
    Homepage(),
    Medaltracker(),
    Records(),
    Stories(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = [
      _buildNavItem('Home', 'assets/Vector.png'),              // Home
      _buildNavItem('Tracker', 'assets/Mask group.png'),       // Tracker
      _buildNavItem('Records', 'assets/Mask group (1).png'),   // Records
      _buildNavItem('Stories', 'assets/Mask group (2).png'),   // Stories
    ];

    return Container(
      height: 50,
      color: color1,
      child: SafeArea(
        top: false,
        child: ClipRRect(
          child: Scaffold(
            extendBody: true,
            body: screens[_currentIndex], // Display the selected screen
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                iconTheme: IconThemeData(color: Colors.white),
              ),
              child: CurvedNavigationBar(

                backgroundColor: Colors.transparent,
                color: color1,
                height: 75,
                animationCurve: Curves.easeInOut,
                animationDuration: Duration(milliseconds: 300),
                items: items,
                index: _currentIndex, // Ensure the current index is reflected
                onTap: (index) {
                  setState(() {
                    _currentIndex = index; // Update the selected index
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Method to build a navigation item with an image and label
  Widget _buildNavItem(String label, String assetPath) {
    return Container(
      height: 60, // Adjust the height as needed
      width: 60,  // Adjust the width as needed
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 15,),
          Image.asset(assetPath, height: 24), // Adjust image size as needed
          SizedBox(height: 4), // Space between image and text
          Text(
            label,
            style: TextStyle(color: Colors.white, fontSize: 12), // Customize label style
          ),
        ],
      ),
    );
  }
}
