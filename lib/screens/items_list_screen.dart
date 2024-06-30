import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping MasterMind',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ItemsListScreen(),
    );
  }
}

class ItemsListScreen extends StatefulWidget {
  @override
  _ItemsListScreenState createState() => _ItemsListScreenState();
}

class _ItemsListScreenState extends State<ItemsListScreen> {
  final List<Item> _items = [
    Item(title: 'Shoes', isChecked: false, icon: Icons.shopping_bag, isBuy: false, quantity: 1, time: ''),
    Item(title: 'Jeans', isChecked: false, icon: Icons.shopping_basket, isBuy: false, quantity: 1, time: ''),
  ];

  final List<Item> _allItems = [
    Item(title: 'Shoes', isChecked: false, icon: Icons.shopping_bag, isBuy: false, quantity: 1, time: ''),
    Item(title: 'Jeans', isChecked: false, icon: Icons.shopping_basket, isBuy: false, quantity: 1, time: ''),
    Item(title: 'Books', isChecked: false, icon: Icons.book, isBuy: false, quantity: 1, time: ''),
    Item(title: 'Electronics', isChecked: false, icon: Icons.devices, isBuy: false, quantity: 1, time: ''),
    Item(title: 'Groceries', isChecked: false, icon: Icons.local_grocery_store, isBuy: false, quantity: 1, time: ''),
    // Add more items here with their icons
  ];

  void _addItem(Item newItem) {
    setState(() {
      _items.add(newItem);
    });
  }

  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  void _toggleCheckbox(int index, bool? value) {
    setState(() {
      _items[index].isChecked = value!;
    });
  }

  void _toggleBuy(int index) {
    setState(() {
      _items[index].isBuy = !_items[index].isBuy;
    });
  }

  void _showAddItemDialog(Item selectedItem) {
    int quantity = selectedItem.quantity; // Default to item's current quantity
    TimeOfDay selectedTime = TimeOfDay.now(); // Default to current time

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Update Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(selectedItem.title),
              SizedBox(height: 10),
              Row(
                children: [
                  Text('Quantity:'),
                  SizedBox(width: 10),
                  DropdownButton<int>(
                    value: quantity,
                    onChanged: (value) {
                      setState(() {
                        quantity = value!;
                      });
                    },
                    items: List.generate(10, (index) => index + 1)
                        .map<DropdownMenuItem<int>>(
                          (int value) => DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      ),
                    )
                        .toList(),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text('Time to Buy:'),
                  SizedBox(width: 10),
                  TextButton(
                    onPressed: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: selectedTime,
                      );
                      if (pickedTime != null) {
                        setState(() {
                          selectedTime = pickedTime;
                        });
                      }
                    },
                    child: Text(selectedTime.format(context)),
                  ),
                ],
              ),
            ],
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
                // Update the item with selected quantity and time
                setState(() {
                  selectedItem.quantity = quantity;
                  selectedItem.time = '${selectedTime.hour}:${selectedTime.minute}';
                });
                Navigator.of(context).pop();
              },
              child: Text('Update'),
            ),
          ],
        );
      },
    );
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green),
              SizedBox(width: 10),
              Text('Success'),
            ],
          ),
          content: Text('Your command is successfully submitted!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Items'),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          Item item = _items[index];
          return Card(
            child: ListTile(
              leading: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(item.icon),
                  SizedBox(width: 8), // Adjust spacing as needed
                  Text(item.title),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      _removeItem(index);
                    },
                  ),
                  SizedBox(width: 8), // Adjust spacing as needed
                  GestureDetector(
                    onTap: () {
                      _toggleBuy(index);
                      _showConfirmationDialog(); // Show confirmation dialog on "BUY"
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                      decoration: BoxDecoration(
                        color: item.isBuy ? Colors.blue : Colors.transparent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        'BUY',
                        style: TextStyle(
                          color: item.isBuy ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              onTap: () {
                _showAddItemDialog(item); // Show dialog to update item details
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show dialog to choose item and add to list
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Choose an Item'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: _allItems.map((item) {
                    return ListTile(
                      leading: Icon(item.icon),
                      title: Text(item.title),
                      onTap: () {
                        _addItem(Item(
                          title: item.title,
                          isChecked: false,
                          icon: item.icon,
                          isBuy: false,
                          quantity: item.quantity,
                          time: item.time,
                        ));
                        Navigator.of(context).pop();
                      },
                    );
                  }).toList(),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class Item {
  String title;
  bool isChecked;
  IconData icon;
  bool isBuy; // New property to track if item is marked as "BUY"
  int quantity; // Number of items to buy
  String time; // Time to buy in string format

  Item({
    required this.title,
    required this.isChecked,
    required this.icon,
    required this.isBuy,
    this.quantity = 1,
    required this.time,
  });
}
