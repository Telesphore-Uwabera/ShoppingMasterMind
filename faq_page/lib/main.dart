import 'package:flutter/material.dart';

void main() {
  runApp(FAQPage());
}

class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('FAQ'),
          centerTitle: true,
        ),
        body: FAQList(),
      ),
    );
  }
}

class FAQList extends StatelessWidget {
  final List<FAQItem> items = [
    FAQItem(
      question: 'What is Shopping Mastermind?',
      answer:
          'Shopping Mastermind is a simple app designed to enhance the shopping experience by providing users with a comprehensive tool for managing their shopping lists.',
    ),
    FAQItem(
      question: 'Who was the inspiration for Shopping Mastermind?',
      answer:
          'Shopping Mastermind found inspiration from award-winning e-commerce sites showcasing innovative design, user-friendly interfaces, and seamless functionality.',
    ),
    FAQItem(
      question: 'What is a to-do list?',
      answer:
          'A to-do list is a list of items that need to be completed. By breaking down a complex goal into smaller, more manageable tasks, you can improve your productivity and reduce the amount of stress you experience.'
    ),
    FAQItem(
        question: 'How do I set a budget limit?',
        answer:
          'Go to your Dashboard and click the "+" button.'
    ),
    FAQItem(
        question: 'How do I set a reminder on my calendar?',
        answer:
          "Go to your Calendar and select the date for which you'd like to add a reminder. Make sure to click 'done' when you're done."
    ),
    FAQItem(
        question: 'Can I change my username?',
        answer:
        'Yes, you can change your username in Settings > Manage profile > Change username.'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return FAQTile(item: items[index]);
      },
    );
  }
}

class FAQItem {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});
}

class FAQTile extends StatefulWidget {
  final FAQItem item;

  FAQTile({required this.item});

  @override
  _FAQTileState createState() => _FAQTileState();
}

class _FAQTileState extends State<FAQTile> {
  bool _isExpanded = false;

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(widget.item.question),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(widget.item.answer),
          ),
        ],
        onExpansionChanged: (bool expanded) {
          setState(() => _isExpanded = expanded);
        },
        initiallyExpanded: _isExpanded,
      ),
    );
  }
}


