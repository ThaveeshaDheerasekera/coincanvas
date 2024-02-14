import 'package:coincanvas/configs/custom_colors.dart';
import 'package:coincanvas/screens/add_new_entry_screen.dart';
import 'package:coincanvas/screens/dashboard_screen.dart';
import 'package:coincanvas/screens/expense_screen.dart';
import 'package:coincanvas/screens/home_screen.dart';
import 'package:coincanvas/screens/income_screen.dart';
import 'package:flutter/material.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
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
          ), // This button is used to navigate back to HomeScreen
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
            icon: const Icon(Icons.arrow_back),
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
