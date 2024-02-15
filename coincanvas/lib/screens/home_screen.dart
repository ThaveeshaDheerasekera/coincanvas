import 'package:coincanvas/configs/custom_colors.dart';
import 'package:coincanvas/screens/book_screen/add_new_entry_screen.dart';
import 'package:coincanvas/widgets/home_screen/book_list_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.oliveColor,
        foregroundColor: Colors.black,
        title: const Text(
          'Books',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        actions: [
          // This button is used to navigate to AddEntryScreen
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddNewEntryScreen(),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: const BookListWidget(),
      ),
    );
  }
}
