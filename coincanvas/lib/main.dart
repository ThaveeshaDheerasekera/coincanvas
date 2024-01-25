import 'package:coincanvas/configs/custom_colors.dart';
import 'package:coincanvas/screens/home_screen.dart';
import 'package:coincanvas/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coin Canvas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: CustomColors.grey),
        scaffoldBackgroundColor: CustomColors.background,
        useMaterial3: true,
        fontFamily: 'Karla',
      ),
      home: const HomeScreen(),
    );
  }
}
