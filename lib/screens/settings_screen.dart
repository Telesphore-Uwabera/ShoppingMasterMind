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
            title: Text('Phone Number'),
            onTap: () {
              // Change phone number
            },
          ),
          // Add more settings options here
        ],
      ),
    );
  }
}
