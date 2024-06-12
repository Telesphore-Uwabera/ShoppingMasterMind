// lib/screens/welcome_screen.dart
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
            Text(
              'Shopping Mastermind',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue,),
            ),
            Text(
              'Take control and achieve your shopping goals.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text("Let's Get Started"),
            ),
          ],
        ),
      ),
    );
  }
}
