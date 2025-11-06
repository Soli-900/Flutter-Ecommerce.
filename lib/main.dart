import 'package:ecommerce_ui_tut/pages/HomePage.dart';
import 'package:ecommerce_ui_tut/pages/item_details.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
      routes: {
        'Home' : (context)=> Homepage(),
        
      },
    );
  }
}
