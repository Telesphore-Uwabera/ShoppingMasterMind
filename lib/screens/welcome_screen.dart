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
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset('assets/shopping_image.png', height: 200, width: 200,),
            ),
            SizedBox(height: 20),
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
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                color: Colors.blue,
                padding: EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Text(
                    "Let's Get Started",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
            IconButton(
              icon: Icon(Icons.help),
              onPressed: () {
                Navigator.pushNamed(context, '/faq');
              },
            ),
          ],
        ),
      ),
    );
  }
}
