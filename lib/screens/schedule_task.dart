import 'package:flutter/material.dart';

class ScheduleTask extends StatefulWidget {
  ScheduleTask({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ScheduleTaskState createState() => _ScheduleTaskState();
}

class _ScheduleTaskState extends State<ScheduleTask> {
  List<Event> _events = [
    Event(date: DateTime(2024, 6, 7), time: TimeOfDay(hour: 10, minute: 0), title: 'Buying Fruits', items: 1),
    Event(date: DateTime(2024, 6, 7), time: TimeOfDay(hour: 12, minute: 0), title: 'Buying Clothes', items: 2),
    // Add more events as needed
  ];

  void _addEvent(String title, int items, DateTime date, TimeOfDay time) {
    setState(() {
      _events.add(Event(date: date, time: time, title: title, items: items));
    });
  }

  void _removeEvent(Event event) {
    setState(() {
      _events.remove(event);
    });
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
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _events.length,
        itemBuilder: (context, index) {
          final event = _events[index];
          return ListTile(
            title: Text(event.title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Items: ${event.items}'),
                Text('Time: ${event.time.format(context)}'),
                Text('Date: ${event.date.toString()}'),
              ],
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                _removeEvent(event);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddEventDialog(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      persistentFooterButtons: [
        ElevatedButton(
          onPressed: () {
            _showConfirmationDialog();
          },
          child: Text('BUY'),
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
          ),
        ),
      ],
    );
  }

  void _showAddEventDialog(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController itemsController = TextEditingController();
    TimeOfDay? selectedTime;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Event'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: 'Product Name'),
                ),
                TextField(
                  controller: itemsController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Number of Items'),
                ),
                ListTile(
                  title: Text('Time to Buy'),
                  trailing: IconButton(
                    icon: Icon(Icons.access_time),
                    onPressed: () async {
                      selectedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (titleController.text.isNotEmpty &&
                        itemsController.text.isNotEmpty &&
                        selectedTime != null) {
                      _addEvent(
                        titleController.text,
                        int.parse(itemsController.text),
                        DateTime.now(), // Change this to selected date
                        selectedTime!,
                      );
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class Event {
  final DateTime date;
  final TimeOfDay time;
  final String title;
  final int items;

  Event({
    required this.date,
    required this.time,
    required this.title,
    required this.items,
  });
}
