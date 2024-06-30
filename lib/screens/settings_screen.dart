// settings_screen.dart
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Username'),
            onTap: () {
              // Change username
            },
          ),
          ListTile(
            title: Text('Email'),
            onTap: () {
              // Change email
            },
          ),
          ListTile(
            title: Text('Password'),
            onTap: () {
              // Change password
            },
          ),
          ListTile(
            title: Text('Location Settings'),
            onTap: () {
              Navigator.pushNamed(context, '/faq'); // Replace with your location settings screen route
            },
          ),
          ListTile(
            title: Text('Deactivate Account'),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Do you need to deactivate the account?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'No',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Account deactivated'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text(
                          'Yes',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Profile updated!!!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
