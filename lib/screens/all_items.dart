import 'package:flutter/material.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final List<Map<String, dynamic>> _items = [
    {'title': 'Books', 'isChecked': false},
    {'title': 'Shoes', 'isChecked': false},
    {'title': 'Jeans', 'isChecked': false},
    {'title': 'Table', 'isChecked': false},
    {'title': 'Basket', 'isChecked': false},
    {'title': 'Cups', 'isChecked': false},
    {'title': 'Tshirt', 'isChecked': false},
  ];

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
                    title: Text(_items[index]['title']),
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