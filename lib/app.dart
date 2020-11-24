import 'package:flutter/material.dart';
import 'package:mymoney/screens/login_screen.dart';
import 'package:mymoney/services/database_service.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Load the db when opening the app to avoid UI getting stuck
    LocalDatabaseService.getInstance();
    
    return MaterialApp(
      title: 'My Money',
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[850],
        fontFamily: 'Montserrat',
      ),
    );
  }
}