import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQs'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('What is Shopping Mastermind?'),
            subtitle: Text(
                'Shopping Mastermind is an app designed to enhance your shopping experience.'),
          ),
          // Add more FAQs here
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new FAQ
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
