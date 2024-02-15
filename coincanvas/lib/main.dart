import 'package:coincanvas/configs/custom_colors.dart';
import 'package:coincanvas/firebase_options.dart';
import 'package:coincanvas/repositories/book_respository.dart';
import 'package:coincanvas/repositories/entry_repository.dart';
import 'package:coincanvas/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
          colorScheme: ColorScheme.fromSeed(seedColor: CustomColors.oliveColor),
          useMaterial3: true,
          fontFamily: 'Karla',
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
