import 'package:firebaseseries2/utils/app_color.dart';
import 'package:flutter/material.dart';


class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color2,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            // Handle back button press
          },
        ),
        title: Text('Profile',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700),),
        centerTitle: false,
        backgroundColor:color2,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/Ellipse 2.png'), // Replace with your image
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                       
                        showBottomSheetForImage(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(5),
                        child: Icon(
                          Icons.camera_alt,
                          size: 24,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            
            ProfileFieldWithLabel(
              labelText: 'Display name',
              icon: Icons.edit,
            ),
            ProfileFieldWithLabel(
              labelText: 'Email',
              icon: Icons.edit,
            ),
            ProfileFieldWithLabel(
              labelText: 'Date of birth',
              icon: null,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Trigger the bottom sheet pop-up menu
                showBottomSheetMenu(context);
              },
              child: Text('Open Bottom Menu'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade700,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Bottom sheet pop-up for image upload options
  void showBottomSheetForImage(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 120,
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Take a photo'),
                onTap: () {
                  // Handle camera option
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Choose from gallery'),
                onTap: () {
                  // Handle gallery option
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Bottom sheet pop-up menu for options
  void showBottomSheetMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      backgroundColor:color1,
      builder: (BuildContext context) {
        return Container(
          height: 363,
          width: 430,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ProfileOption(
                icon: Icons.share,
                label: 'Share with your friends',
                onTap: () {
                  // Handle share
                },
              ),
              ProfileOption(
                icon: Icons.star,
                label: 'Rate the app',
                onTap: () {
                  // Handle rate
                },
              ),
              ProfileOption(
                icon: Icons.logout,
                label: 'Logout',
                onTap: () {
                  // Handle logout
                },
              ),
              ProfileOption(
                icon: Icons.delete,
                label: 'Delete account',
                onTap: () {
                  // Handle delete
                },
              ),
            ],
          ),
        );
      },
    );
  }
}


class ProfileFieldWithLabel extends StatelessWidget {
  final String labelText;
  final IconData? icon;

  const ProfileFieldWithLabel({
    required this.labelText,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                labelText,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (icon != null)
                Icon(
                  icon,
                  size: 20,
                ),
            ],
          ),
          SizedBox(height: 5),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

// Custom widget for the options in the bottom sheet
class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const ProfileOption({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Colors.white,
      ),
      onTap: onTap,
    );
  }
}