import 'package:flutter/material.dart';

class ItemsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Items'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Bought'),
            subtitle: Text('Books'),
          ),
          ListTile(
            title: Text('Pending Items'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CheckboxListTile(
                  value: false,
                  onChanged: (bool? value) {},
                  title: Text('Shoes'),
                ),
                CheckboxListTile(
                  value: false,
                  onChanged: (bool? value) {},
                  title: Text('Jeans'),
                ),
                // Add more items here
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new item
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
