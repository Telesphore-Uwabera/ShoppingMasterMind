import 'package:flutter/material.dart';
import '../widgets/category_card.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search for the products',
              prefixIcon: Icon(Icons.search),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              children: [
                CategoryCard(icon: Icons.local_grocery_store, label: 'Groceries'),
                CategoryCard(icon: Icons.flash_on, label: 'Electronics'),
              ],
            ),
          ),
          ListTile(
            title: Text('Today\'s plan'),
          ),
          ListTile(
            title: Text('Buy fruit'),
            subtitle: Text('10:00 am'),
          ),
          // Add more items here
        ],
      ),
    );
  }
}
