import 'package:coincanvas/configs/custom_colors.dart';
import 'package:coincanvas/screens/book_screen/add_new_entry_screen.dart';
import 'package:coincanvas/screens/book_screen/dashboard_screen.dart';
import 'package:coincanvas/screens/book_screen/expense_screen.dart';
import 'package:coincanvas/screens/book_screen/income_screen.dart';
import 'package:flutter/material.dart';

class BookHomeScreen extends StatefulWidget {
  const BookHomeScreen({super.key});

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
          title: const Text(
            'General',
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
          child: const TabBarView(
            physics: BouncingScrollPhysics(),
            children: [
              // Dashboard of the Book
              DashboardScreen(),
              // Income Dashboard
              IncomeScreen(),
              // Expense Dashboard
              ExpenseScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
