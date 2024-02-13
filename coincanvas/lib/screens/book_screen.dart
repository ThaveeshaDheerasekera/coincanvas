import 'package:coincanvas/configs/custom_colors.dart';
import 'package:coincanvas/screens/expense_screen.dart';
import 'package:coincanvas/screens/income_screen.dart';
import 'package:coincanvas/screens/add_new_entry_screen.dart';
import 'package:coincanvas/screens/dashboard_screen.dart';
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
          centerTitle: true,
          backgroundColor: CustomColors.oliveColor,
          foregroundColor: Colors.black,
          title: const Text(
            'Transactions (LKR)',
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
          // Botton Tabbar
          bottom: TabBar(
            physics: const BouncingScrollPhysics(),
            dividerColor: Colors.transparent,
            dividerHeight: 0.5,
            indicatorSize: TabBarIndicatorSize.tab,
            unselectedLabelColor: Colors.black,
            labelColor: CustomColors.oliveColor,
            indicator: BoxDecoration(color: Colors.black),
            tabs: const [
              Tab(text: 'Dashboard'),
              Tab(text: 'Incomes'),
              Tab(text: 'Expenses')
            ],
          ),
        ),
        body: const TabBarView(
          physics: BouncingScrollPhysics(),
          children: [
            DashboardScreen(),
            IncomeScreen(),
            ExpenseScreen(),
          ],
        ),
      ),
    );
  }
}
