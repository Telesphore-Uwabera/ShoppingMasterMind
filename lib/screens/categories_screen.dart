import 'package:flutter/material.dart';

void main() {
  runApp(CategoriesScreen());
}

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShoppingMastermindHomePage(),
    );
  }
}

class ShoppingMastermindHomePage extends StatefulWidget {
  @override
  _ShoppingMastermindHomePageState createState() =>
      _ShoppingMastermindHomePageState();
}

class _ShoppingMastermindHomePageState
    extends State<ShoppingMastermindHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    HomePage(),
    CalendarPage(),
    NotesPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,),),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex],
      floatingActionButton: Container(
        padding: EdgeInsets.only(bottom: 100),
        child: FloatingActionButton(
          onPressed: () {},
          child: Text(
            '+',
            style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blue,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 40.0,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_month_rounded), label: 'Calendar'),
            BottomNavigationBarItem(icon: Icon(Icons.note_add_rounded), label: 'Notes'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? _selectedTaskIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            children: <Widget>[
              CategoryContainer(
                icon: Icons.shopping_bag, 
                text: 'Category 1', 
                backgroundColor: Colors.white
              ),
              CategoryContainer(
                icon: Icons.shopping_cart, 
                text: 'Category 2', 
                backgroundColor: Colors.white
              ),
              CategoryContainer(
                icon: Icons.local_offer, 
                text: 'Category 3', 
                backgroundColor: Colors.white
              ),
              CategoryContainer(
                icon: Icons.local_grocery_store, 
                text: 'Category 4', 
                backgroundColor: Colors.white
              ),
              CategoryContainer(
                icon: Icons.fastfood, 
                text: 'Category 5', 
                backgroundColor: Colors.white
              ),
              CategoryContainer(
                icon: Icons.more, 
                text: 'Category 6', 
                backgroundColor: Colors.white
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Today's plan",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                },
                child: Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      Expanded(
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
              color: Color.fromARGB(32, 20, 150, 243),
              child: Column(
                children: <Widget>[
                  TaskContainer(
                    product: 'Product 1',
                    time: '10:00 AM',
                    index: 0,
                    selectedTaskIndex: _selectedTaskIndex,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedTaskIndex = value;
                      });
                    },
                  ),
                  TaskContainer(
                    product: 'Product 2',
                    time: '11:00 AM',
                    index: 1,
                    selectedTaskIndex: _selectedTaskIndex,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedTaskIndex = value;
                      });
                    },
                  ),
                  TaskContainer(
                    product: 'Product 3',
                    time: '12:00 PM',
                    index: 2,
                    selectedTaskIndex: _selectedTaskIndex,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedTaskIndex = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      ],
    );
  }
}

class TaskContainer extends StatelessWidget {
  final String product;
  final String time;
  final int index;
  final int? selectedTaskIndex;
  final ValueChanged<int?> onChanged;

  TaskContainer({
    required this.product,
    required this.time,
    required this.index,
    required this.selectedTaskIndex,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Radio<int>(
        value: index,
        groupValue: selectedTaskIndex,
        onChanged: onChanged,
      ),
      title: Text(product),
      trailing: Text(time),
    );
  }
}

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Calendar Page',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class NotesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Notes Page',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Settings Page',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class CategoryContainer extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color backgroundColor;

  CategoryContainer({
    required this.icon,
    required this.text,
    required this.backgroundColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.blue, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, size: 40, color: Colors.blue),
          SizedBox(height: 8),
          Text(text, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
