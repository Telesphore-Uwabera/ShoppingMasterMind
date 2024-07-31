import 'package:flutter/material.dart';
import 'package:shopping_mastermind/screens/calendar_screen.dart';
import 'package:shopping_mastermind/screens/items_list_screen.dart';
import 'package:shopping_mastermind/screens/settings_screen.dart';
import 'package:shopping_mastermind/screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'All Items',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AllItems(),
      routes: {
        '/welcome': (context) => WelcomeScreen(),
        '/calendar': (context) => CalendarScreen(),
        '/items_list': (context) => ItemsListScreen(),
        '/settings': (context) => SettingsScreen(),
      },
    );
  }
}

class AllItems extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AllItems> {
  final _formKey = GlobalKey<FormState>();
  final List<Map<String, dynamic>> _items = [
    {'title': 'Books', 'isChecked': false, 'icon': Icons.book},
    {'title': 'Bags', 'isChecked': false, 'icon': Icons.leave_bags_at_home},
    {'title': 'Jeans', 'isChecked': false, 'icon': Icons.accessibility},
    {'title': 'Table', 'isChecked': false, 'icon': Icons.table_chart},
    {'title': 'Basket', 'isChecked': false, 'icon': Icons.shopping_basket},
    {'title': 'Cups', 'isChecked': false, 'icon': Icons.coffee},
    {'title': 'phone', 'isChecked': false, 'icon': Icons.phone},
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/welcome');
        break;
      case 1:
        Navigator.pushNamed(context, '/calendar');
        break;
      case 2:
        Navigator.pushNamed(context, '/items_list');
        break;
      case 3:
        Navigator.pushNamed(context, '/settings');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Items',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView.builder(
            itemCount: _items.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(64, 158, 219, 239),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.all(10),
                child: Center(
                  child: CheckboxListTile(
                    title: Row(
                      children: [
                        Icon(_items[index]['icon']),
                        SizedBox(width: 16.0),
                        Text(_items[index]['title']),
                      ],
                    ),
                    value: _items[index]['isChecked'],
                    onChanged: (bool? value) {
                      setState(() {
                        _items[index]['isChecked'] = value!;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ),
                height: 70,
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text(
          '+',
          style: TextStyle(
              color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 40.0,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today), label: 'Calendar'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Items'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ],
        ),
      ),
    );
  }
}