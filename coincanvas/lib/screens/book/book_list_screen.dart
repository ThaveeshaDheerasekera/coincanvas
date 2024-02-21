import 'package:coincanvas/configs/custom_colors.dart';
import 'package:coincanvas/repositories/auth_repository.dart';
import 'package:coincanvas/repositories/book_respository.dart';
import 'package:coincanvas/screens/book/add_new_book_screen.dart';
import 'package:coincanvas/widgets/book/book_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<BookRepository>(context, listen: false).fetchBookList();
    super.initState();
  }

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
        // SignOut Button
        actions: [
          IconButton(
            onPressed: () {
              _showMessage(
                context,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Are you sure you want to logout?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Provider.of<AuthRepository>(context, listen: false)
                            .signOut(context: context);
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      },
                      color: Colors.black,
                      icon: const Icon(Icons.done),
                    ),
                  ],
                ),
              );
            },
            icon:
                const Icon(Icons.account_circle_outlined, color: Colors.black),
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: const BookListWidget(),
      ),
      // This is used to add new books
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      floatingActionButton: FloatingActionButton.small(
        backgroundColor: CustomColors.oliveColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AddNewBookScreen(),
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }

  // Show message function
  void _showMessage(BuildContext context, Widget content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: content,
        // showCloseIcon: true,
        // closeIconColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        backgroundColor: CustomColors.oliveColor,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
