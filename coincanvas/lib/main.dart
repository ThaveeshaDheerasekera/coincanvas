import 'package:coincanvas/repositories/entry_repository.dart';
import 'package:coincanvas/screens/book_screen.dart';
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
      ],
      child: MaterialApp(
        title: 'Coin Canvas',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
          fontFamily: 'Karla',
        ),
        home: const BookScreen(),
      ),
    );
  }
}
