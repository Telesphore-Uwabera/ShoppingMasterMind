import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopping_mastermind/screens/all_items.dart' as all_items1;
import 'package:shopping_mastermind/screens/all_items_screen.dart' as all_items2;
import 'package:shopping_mastermind/screens/calendar_screen.dart';
import 'package:shopping_mastermind/screens/categories_screen.dart';
import 'package:shopping_mastermind/screens/dashboard_screen.dart';
import 'package:shopping_mastermind/screens/faq_screen.dart';
import 'package:shopping_mastermind/screens/items_list_screen.dart';
import 'package:shopping_mastermind/screens/location_screen.dart';
import 'package:shopping_mastermind/screens/login_screen.dart';
import 'package:shopping_mastermind/screens/schedule_task.dart';
import 'package:shopping_mastermind/screens/settings_screen.dart';
import 'package:shopping_mastermind/screens/signup_screen.dart';
import 'package:shopping_mastermind/screens/welcome_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        '/all_items': (context) => all_items1.AllItems(),
        '/calendar': (context) => CalendarScreen(),
        '/categories': (context) => CategoriesScreen(),
        '/scheduleTasks': (context) => ScheduleTask(title: 'Calendar App'),
        '/dashboard': (context) => DashboardScreen(),
        '/faq': (context) => FAQScreen(),
        '/items_list': (context) => ItemsListScreen(),
        '/settings': (context) => SettingsScreen(),
        '/location': (context) => LocationSelectionScreen(),
      },
    );
  }
}
