import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shopping_mastermind/screens/all_items_screen.dart';
import 'package:shopping_mastermind/screens/schedule_task.dart';
import 'package:shopping_mastermind/screens/calendar_screen.dart';
import 'package:shopping_mastermind/screens/categories_screen.dart';
import 'package:shopping_mastermind/screens/dashboard_screen.dart';
import 'package:shopping_mastermind/screens/faq_screen.dart';
import 'package:shopping_mastermind/screens/items_list_screen.dart';
import 'package:shopping_mastermind/screens/login_screen.dart';
import 'package:shopping_mastermind/screens/settings_screen.dart';
import 'package:shopping_mastermind/screens/signup_screen.dart';
import 'package:shopping_mastermind/screens/welcome_screen.dart';
import 'package:shopping_mastermind/screens/location_screen.dart'; 

Future main()async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
  await Firebase.initializeApp(options: FirebaseOptions(apiKey: "AIzaSyAYegns9yTqHzp14pJ1I-HWJULJZvjrucU", appId: "1:589050353483:web:8793de13c1e17c1e7cbace", messagingSenderId: "589050353483", projectId: "shoppingmastermind-e056d"))
}
  await Firebase.initializeApp();
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
      home: WelcomeScreen(),  // Adjust based on your application logic
      routes: {
        '/welcome': (context) => WelcomeScreen(),
        '/signup': (context) => SignupScreen(),
        '/login': (context) => LoginScreen(),
        '/all_items': (context) => AllItems(),
        '/calendar': (context) => CalendarScreen(),
        '/categories': (context) => CategoriesScreen(),
        '/scheduleTasks': (context) => ScheduleTask(title: 'Calendar App'),
        '/dashboard': (context) => DashboardScreen(),
        '/faq': (context) => FAQScreen(),
        '/items_list': (context) => ItemsListScreen(),
        '/settings': (context) => SettingsScreen(),
        '/location': (context) => LocationSelectionScreen(), // Use LocationSelectionScreen instead of LocationScreen
      },
    );
  }
}
