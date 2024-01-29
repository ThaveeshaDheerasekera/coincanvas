import 'package:coincanvas/configs/constants.dart';
import 'package:coincanvas/configs/custom_colors.dart';
import 'package:coincanvas/screens/new_transaction_screen.dart';
import 'package:coincanvas/widgets/home/home_screen_list_widget.dart';
import 'package:coincanvas/widgets/home/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: CustomColors.tealBlue,
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
                    builder: (context) => const NewTransactionScreen(),
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
            unselectedLabelColor: Colors.black.withOpacity(0.5),
            labelColor: Colors.black,
            indicator: BoxDecoration(color: CustomColors.cadetBlue),
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
            SizedBox(),
            SizedBox(),
          ],
        ),
      ),
    );
  }
}
