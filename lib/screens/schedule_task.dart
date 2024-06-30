import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendar App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScheduleTask(title: 'Calendar App'),
    );
  }
}

class ScheduleTask extends StatefulWidget {
  ScheduleTask({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ScheduleTask> {
  int _selectedDay = 7;
  DateTime _selectedDate = DateTime(2024, 6, 7);
  List<Event> _events = [
    Event(date: DateTime(2024, 6, 7), time: '10:00AM', title: 'Buying Fruits'),
    Event(date: DateTime(2024, 6, 7), time: '12:00PM', title: 'Buying Clothes'),
  ];

  void _selectDay(int day) {
    setState(() {
      _selectedDay = day;
      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month, day);
    });
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2024),
      lastDate: DateTime(2025),
    ).then((pickedDate) {
      if (pickedDate != null) {
        setState(() {
          _selectedDate = pickedDate;
          _selectedDay = pickedDate.day;
        });
      }
    });
  }

  void _addEvent() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController titleController = TextEditingController();
        TextEditingController timeController = TextEditingController();
        return AlertDialog(
          title: Text('Add Event'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(hintText: 'Enter event title'),
              ),
              SizedBox(height: 16),
              TextField(
                controller: timeController,
                decoration: InputDecoration(hintText: 'Enter event time'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _events.add(Event(
                    date: _selectedDate,
                    time: timeController.text,
                    title: titleController.text,
                  ));
                });
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            child: CalendarView(
              selectedDay: _selectedDay,
              onDaySelected: _selectDay,
              selectedDate: _selectedDate,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _events
                  .where((event) =>
                      event.date.year == _selectedDate.year &&
                      event.date.month == _selectedDate.month &&
                      event.date.day == _selectedDate.day)
                  .toList()
                  .length,
              itemBuilder: (context, index) {
                final event = _events
                    .where((event) =>
                        event.date.year == _selectedDate.year &&
                        event.date.month == _selectedDate.month &&
                        event.date.day == _selectedDate.day)
                    .toList()[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
                  child: Container(
                    color: Color.fromARGB(32, 20, 150, 243),
                    child: ListTile(
                      title: Text(event.title),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(event.time),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            _events.remove(event);
                          });
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

        ],
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

class CalendarView extends StatelessWidget {
  final int selectedDay;
  final Function(int) onDaySelected;
  final DateTime selectedDate;

  const CalendarView({
    Key? key,
    required this.selectedDay,
    required this.onDaySelected,
    required this.selectedDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 7,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(31, (index) {
        int day = index + 1;
        return GestureDetector(
          onTap: () {
            onDaySelected(day);
          },
          child: Container(
            decoration: BoxDecoration(
              color: day == selectedDay
                  ? Colors.blue.withOpacity(0.2)
                  : Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: day == selectedDay
                    ? Colors.blue
                    : Colors.grey.withOpacity(0.5),
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              '$day',
              style: TextStyle(
                fontSize: 18,
                fontWeight: day == selectedDay ? FontWeight.bold : FontWeight.normal,
                color: day == selectedDay ? Colors.blue : Colors.black,
              ),
            ),
          ),
        );
      }),
    );
  }
}

class Event {
  final DateTime date;
  final String time;
  final String title;

  Event({
    required this.date,
    required this.time,
    required this.title,
  });
}
