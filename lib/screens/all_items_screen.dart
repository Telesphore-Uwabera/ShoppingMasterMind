import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AllItems extends StatefulWidget {
  @override
  _AllItemsState createState() => _AllItemsState();
}

class _AllItemsState extends State<AllItems> {
  final _formKey = GlobalKey<FormState>();
  final DatabaseReference _database = FirebaseDatabase.instance.ref();
  List<Map<String, dynamic>> _items = [];

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  Future<void> _loadItems() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      _database.child('users/${user.uid}/items').onValue.listen((event) {
        final List<Map<String, dynamic>> loadedItems = [];
        final data = event.snapshot.value as Map?;
        if (data != null) {
          data.forEach((key, value) {
            loadedItems.add({
              'key': key,
              'title': value['title'],
              'isChecked': value['isChecked'],
              'icon': IconData(value['icon'], fontFamily: 'MaterialIcons'),
            });
          });
        }
        setState(() {
          _items = loadedItems;
        });
      });
    }
  }

  Future<void> _addItem(String title, IconData icon) async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final newItem = {
        'title': title,
        'isChecked': false,
        'icon': icon.codePoint,
      };
      _database.child('users/${user.uid}/items').push().set(newItem);
    }
  }

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
                    value: _items[index]['isChecked'] ?? false,
                    onChanged: (bool? value) {
                      setState(() {
                        _items[index]['isChecked'] = value ?? false;
                      });
                      _updateItem(index, value ?? false);
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
        onPressed: () {
          // Show a dialog to add a new item
          _showAddItemDialog(context);
        },
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

  void _showAddItemDialog(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Item'),
          content: TextField(
            controller: titleController,
            decoration: InputDecoration(labelText: 'Item Title'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final title = titleController.text.trim();
                if (title.isNotEmpty) {
                  _addItem(title, Icons.add);
                }
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _updateItem(int index, bool isChecked) async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final itemKey = _items[index]['key'];
      _database
          .child('users/${user.uid}/items/$itemKey')
          .update({'isChecked': isChecked});
    }
  }
}
