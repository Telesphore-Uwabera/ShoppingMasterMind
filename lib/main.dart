import 'package:flutter/material.dart';
import 'package:shopping_mastermind/screens/all_items.dart';
import 'screens/schedule_task.dart';
import 'screens/calendar_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/faq_screen.dart';
import 'screens/items_list_screen.dart';
import 'screens/login_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/welcome_screen.dart';

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
      home: WelcomeScreen(),
      routes: {
        '/welcome': (context) => WelcomeScreen(),
        '/signup': (context) => SignupScreen(),
        '/login': (context) => LoginScreen(),
        // '/add_item': (context) => AddItemScreen(),
        '/items': (context) => AllItems(),
        '/calendar': (context) => CalendarScreen(),
        '/categories': (context) => CategoriesScreen(),
        '/scheduleTasks': (context) => ScheduleTask(title: 'Calendar App',),
        // '/dashboard': (context) => DashboardScreen(),
        '/faq': (context) => FAQScreen(),
        '/items': (context) => ItemsListScreen(),
        '/settings': (context) => SettingsScreen(),
      },
    );
  }
}
