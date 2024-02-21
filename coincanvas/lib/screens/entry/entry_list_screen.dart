import 'package:coincanvas/configs/custom_colors.dart';
import 'package:coincanvas/models/book.dart';
import 'package:coincanvas/screens/entry/add_new_entry_screen.dart';
import 'package:coincanvas/screens/entry/dashboard_screen.dart';
import 'package:coincanvas/screens/entry/expense_screen.dart';
import 'package:coincanvas/screens/entry/income_screen.dart';
import 'package:flutter/material.dart';

class BookHomeScreen extends StatefulWidget {
  final Book book;
  const BookHomeScreen({super.key, required this.book});

  @override
  State<BookHomeScreen> createState() => _BookHomeScreenState();
}

class _BookHomeScreenState extends State<BookHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColors.oliveColor,
          foregroundColor: Colors.black,
          // title of the Book
          title: Text(
            widget.book.title,
            style: const TextStyle(fontWeight: FontWeight.w700),
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
          // Bottom TabBar
          bottom: TabBar(
            dividerColor: Colors.transparent,
            dividerHeight: 0.5,
            indicatorSize: TabBarIndicatorSize.tab,
            unselectedLabelColor: Colors.black,
            labelColor: CustomColors.oliveColor,
            indicator: const BoxDecoration(color: Colors.black),
            tabs: const [
              Tab(text: 'Dashboard'),
              Tab(text: 'Incomes'),
              Tab(text: 'Expenses')
            ],
          ),
        ),
        // Container is used to set background color
        body: Container(
          color: Colors.black,
          child: TabBarView(
            physics: const BouncingScrollPhysics(),
            children: [
              // Dashboard of the Book
              DashboardScreen(book: widget.book),
              // Income Dashboard
              const IncomeScreen(),
              // Expense Dashboard
              const ExpenseScreen(),
            ],
          ),
        ),
        // This is used to add new entries
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniEndDocked,
        floatingActionButton: FloatingActionButton.small(
          backgroundColor: CustomColors.oliveColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddNewEntryScreen(),
            ),
          ),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
