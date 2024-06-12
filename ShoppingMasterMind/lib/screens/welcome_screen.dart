import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0), // Set the border radius here
              child: Image.asset('assets/shopping_image.png'),
            ), // Replace with your image asset
            SizedBox(height: 20), // Add space between the image and the text
            Text(
              'Shopping Mastermind',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Text(
              'Take control and achieve your shopping goals.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0), // Set the border radius here
              child: Container(
                color: Colors.blue,
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Let's Get Started",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0, // Adjust the font size as needed
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: WelcomeScreen(),
    routes: {
      '/login': (context) => LoginScreen(), // Make sure to define this screen
    },
  ));
}

// Add this placeholder for the LoginScreen if you haven't already defined it.
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Center(
        child: Text('Login Screen Content'),
      ),
    );
  }
}
