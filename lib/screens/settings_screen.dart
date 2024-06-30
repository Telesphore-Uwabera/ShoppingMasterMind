import 'package:flutter/material.dart';

void main() {
  runApp(SettingsApp());
}

class SettingsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SettingsSection(
                title: 'Account',
                children: [
                  SettingsTile(
                    icon: Icons.person,
                    title: 'Profile',
                    subtitle: 'Update your profile information',
                  ),
                  SettingsTile(
                    icon: Icons.lock,
                    title: 'Change Password',
                    subtitle: 'Update your password',
                  ),
                ],
              ),
              SettingsSection(
                title: 'Notifications',
                children: [
                  SettingsTile(
                    icon: Icons.notifications,
                    title: 'Push Notifications',
                    subtitle: 'Manage push notifications',
                  ),
                ],
              ),
              SettingsSection(
                title: 'Privacy',
                children: [
                  SettingsTile(
                    icon: Icons.lock_outline,
                    title: 'Privacy Policy',
                    subtitle: 'Read our privacy policy',
                  ),
                  SettingsTile(
                    icon: Icons.security,
                    title: 'Security',
                    subtitle: 'Update security settings',
                  ),
                ],
              ),
              SettingsSection(
                title: 'About',
                children: [
                  SettingsTile(
                    icon: Icons.info,
                    title: 'About Us',
                    subtitle: 'Learn more about us',
                  ),
                  SettingsTile(
                    icon: Icons.help,
                    title: 'Help',
                    subtitle: 'Get help and support',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const SettingsSection({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        Column(children: children),
      ],
    );
  }
}

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const SettingsTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: () {
        // Handle tile tap
      },
    );
  }
}
