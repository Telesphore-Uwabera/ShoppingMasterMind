import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('FAQs'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Feedback'),
              Tab(text: 'FAQs'),
              Tab(text: 'What\'s New'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('Feedback')),
            _buildFAQTab(),
            _buildWhatsNewTab(context), // Added the new tab
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Default action for floating action button
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _buildFAQTab() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search using keywords',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              _buildCategory('About Shopping Mastermind', [
                _buildFAQItem(
                  'What is Shopping Mastermind?',
                  'Shopping Mastermind is a simple app designed to enhance the shopping experience by providing users with a comprehensive tool for managing their shopping lists.',
                ),
                _buildFAQItem(
                  'Who was the inspiration for Shopping Mastermind?',
                  'The inspiration for Shopping Mastermind came from the need for a user-friendly app to simplify shopping and manage lists effectively.',
                ),
                _buildFAQItem(
                  'What is a to-do list?',
                  'A to-do list is a list of tasks or activities that need to be completed, often organized in order of priority.',
                ),
              ]),
              _buildCategory('Navigation', [
                _buildFAQItem(
                  'How do I set a budget limit?',
                  'To set a budget limit, go to the settings and select "Budget". From there, you can set and manage your budget limits.',
                ),
                _buildFAQItem(
                  'How do I set a reminder on my calendar?',
                  'To set a reminder on your calendar, navigate to the "Reminders" section, and select "Add Reminder". You can then set the date, time, and details for the reminder.',
                ),
                _buildFAQItem(
                  'Can I change my username?',
                  'Yes, you can change your username in the account settings under "Username".',
                ),
              ]),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategory(String title, List<Widget> items) {
    return ExpansionTile(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
      ),
      children: items,
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return ListTile(
      title: Text(question),
      subtitle: Text(answer),
    );
  }

  Widget _buildWhatsNewTab(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.0),
          _buildAddQuestionButton(context),
          SizedBox(height: 16.0),
          Center(child: Text('What\'s New')),
        ],
      ),
    );
  }

  Widget _buildAddQuestionButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _showAddQuestionDialog(context);
      },
      child: Text('Add New Question'),
    );
  }

  void _showAddQuestionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newQuestion = '';
        String newAnswer = '';

        return AlertDialog(
          title: Text('Add New Question'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Question',
                ),
                onChanged: (value) {
                  newQuestion = value;
                },
              ),
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Answer',
                ),
                onChanged: (value) {
                  newAnswer = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Add logic to save the new question and answer
                _saveNewQuestion(context, newQuestion, newAnswer);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _saveNewQuestion(BuildContext context, String question, String answer) {
    // Implement your logic to save the new question and answer
    // For demonstration, just print them
    print('New Question: $question');
    print('Answer: $answer');

    // Close the dialog
    Navigator.pop(context);
  }
}
