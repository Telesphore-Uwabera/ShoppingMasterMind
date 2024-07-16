import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          SettingTile(
            icon: Icons.person,
            title: 'Username',
            onPressed: (context) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ChangeDetailDialog(
                    title: 'Change Username',
                    currentValue: 'Current Username',
                    oldLabelText: 'Old Username',
                    newLabelText: 'New Username',
                  );
                },
              );
            },
          ),
          SettingTile(
            icon: Icons.phone,
            title: 'Phone Number',
            onPressed: (context) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ChangeDetailDialog(
                    title: 'Change Phone Number',
                    currentValue: 'Current Phone Number',
                    oldLabelText: 'Old Phone Number',
                    newLabelText: 'New Phone Number',
                  );
                },
              );
            },
          ),
          SettingTile(
            icon: Icons.email,
            title: 'Email',
            onPressed: (context) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ChangeDetailDialog(
                    title: 'Change Email',
                    currentValue: 'Current Email',
                    oldLabelText: 'Old Email',
                    newLabelText: 'New Email',
                  );
                },
              );
            },
          ),
          SettingTile(
            icon: Icons.lock,
            title: 'Password',
            onPressed: (context) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ChangeDetailDialog(
                    title: 'Change Password',
                    currentValue: 'Current Password',
                    oldLabelText: 'Old Password',
                    newLabelText: 'New Password',
                  );
                },
              );
            },
          ),
          SettingTile(
            icon: Icons.location_on,
            title: 'Location',
            onPressed: (context) {
              Navigator.pushNamed(context, '/location'); // Replace with your location settings screen route
            },
          ),
          SettingTile(
            icon: Icons.check_box,
            title: 'To-Do Lists',
            onPressed: (context) {
              Navigator.pushNamed(context, '/all_items'); // Navigate to To-Do Lists screen
            },
          ),
          SettingTile(
            icon: Icons.help,
            title: 'FAQs',
            onPressed: (context) {
              Navigator.pushNamed(context, '/faq'); // Replace with your FAQ screen route
            },
          ),
          ListTile(
            leading: Icon(Icons.delete, color: Colors.red),
            title: Text('Deactivate', style: TextStyle(color: Colors.red)),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Do you need to deactivate the account?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'No',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Account deactivated'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text(
                          'Yes',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Profile updated!!!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.check),
      ),
    );
  }
}

class SettingTile extends StatefulWidget {
  final IconData icon;
  final String title;
  final Function(BuildContext) onPressed;

  SettingTile({required this.icon, required this.title, required this.onPressed});

  @override
  _SettingTileState createState() => _SettingTileState();
}

class _SettingTileState extends State<SettingTile> {
  bool _isTapped = false;

  void _handleTap() {
    setState(() {
      _isTapped = !_isTapped;
    });
    widget.onPressed(context);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(widget.icon, color: Colors.blue),
      title: Text(
        widget.title,
        style: TextStyle(color: _isTapped ? Colors.blue : Colors.black),
      ),
      onTap: _handleTap,
    );
  }
}

class ChangeDetailDialog extends StatelessWidget {
  final String title;
  final String currentValue;
  final String oldLabelText;
  final String newLabelText;

  ChangeDetailDialog({
    required this.title,
    required this.currentValue,
    required this.oldLabelText,
    required this.newLabelText,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: oldLabelText,
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: newLabelText,
            ),
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
            // Save the changes
            Navigator.pop(context);
          },
          child: Text('Save'),
        ),
      ],
    );
  }
}
