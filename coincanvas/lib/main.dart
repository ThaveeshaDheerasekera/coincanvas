import 'package:coincanvas/repositories/book_respository.dart';
import 'package:coincanvas/repositories/entry_repository.dart';
import 'package:coincanvas/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => EntryRepository()),
        ChangeNotifierProvider(create: (context) => BookRepository()),
      ],
      child: MaterialApp(
        title: 'Coin Canvas',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
          fontFamily: 'Karla',
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
