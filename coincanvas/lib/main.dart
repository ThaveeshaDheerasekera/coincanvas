import 'package:coincanvas/configs/custom_colors.dart';
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
      ],
      child: MaterialApp(
        title: 'Coin Canvas',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: CustomColors.grey),
          useMaterial3: true,
          fontFamily: 'Karla',
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
