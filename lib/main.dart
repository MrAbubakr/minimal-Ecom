import 'package:flutter/material.dart';
import 'package:minimal_ecom_app/models/shop.dart';
import 'package:minimal_ecom_app/screens/shopscreen.dart';
import 'package:minimal_ecom_app/screens/cartscren.dart';
import 'package:minimal_ecom_app/screens/introscreen.dart';
import 'package:minimal_ecom_app/themes/light_mode.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => Shop(),
    child: const MyApp(),)
    
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroScreen(),
      theme: lightmode,
      routes: {
        '/intro':(context) => IntroScreen(),
        '/shop':(context) => ShopScreen(),
        '/cart':(context) => CartScreen(),
      }
       );
  }
}

