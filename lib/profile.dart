import 'package:flutter/material.dart';
import 'package:reminderly1/main.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('assets/profile_image.jpg'), // Replace with your profile image asset
            ),
            SizedBox(height: 20.0),
            Text(
              'John Doe', // Replace with user's name
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'johndoe@example.com', // Replace with user's email
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Add functionality to edit profile
              },
              child: Text('Edit Profile'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Logout'),
                      content: Text('Are you sure you want to logout?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => LoginPage()), // Navigate to LoginPage
                            );
                          },
                          child: Text('Logout'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }
}
