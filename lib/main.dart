import 'package:ecommerce_ui_tut/pages/HomePage.dart';
import 'package:ecommerce_ui_tut/pages/cart_page.dart';
import 'package:ecommerce_ui_tut/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); 
  await Hive.initFlutter(); // start hive
  await Hive.openBox('cartBox'); // opent cart box 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
      routes: {
        'Home' : (context)=> Homepage(),
        'Cart' : (context)=> CartPage(navIndex: 1,),
        'Profile' : (context)=> ProfilePage(),
        
      },
    );
  }
}
