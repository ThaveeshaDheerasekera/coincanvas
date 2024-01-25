import 'package:coincanvas/configs/constants.dart';
import 'package:coincanvas/configs/custom_colors.dart';
import 'package:coincanvas/screens/new_transaction_screen.dart';
import 'package:coincanvas/widgets/global/elevated_button_widget.dart';
import 'package:coincanvas/widgets/global/title_widget.dart';
import 'package:coincanvas/widgets/home/home_screen_list_widget.dart';
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
          toolbarHeight: 35,
          centerTitle: true,
          backgroundColor: CustomColors.background,
          title: const Text('Transactions (LKR)'),
          actions: [
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
          bottom: TabBar(
            physics: const BouncingScrollPhysics(),
            dividerColor: Colors.transparent,
            dividerHeight: 1,
            indicatorWeight: 0,
            indicatorSize: TabBarIndicatorSize.label,
            unselectedLabelColor: Colors.black.withOpacity(0.5),
            labelColor: Colors.black,
            indicator: UnderlineTabIndicator(
              borderSide:
                  BorderSide(width: 2.0, color: CustomColors.deepCerulean),
              insets: EdgeInsets.zero,
            ),
            tabs: const [
              Tab(text: 'Dashboard'),
              Tab(text: 'Incomes'),
              Tab(text: 'Expenses')
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              // padding: const EdgeInsets.only(top: 15),
              height: Constants.screenSize(context).height,
              child: Column(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 2, vertical: 7),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                            width: 0.5, color: Colors.grey.withOpacity(0.5)),
                        bottom: BorderSide(
                            width: 1, color: Colors.grey.withOpacity(0.5)),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        summeryItem('Total', '130,678,009', Colors.black),
                        summeryItem('Income', '136,789,000', Colors.green),
                        summeryItem('Expense', '136,789,000', Colors.red),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.all(15),
                        child: const HomeScreenListWidget()),
                  ),
                ],
              ),
            ),
            SizedBox(),
            SizedBox(),
          ],
        ),
      ),
    );
  }

  Column summeryItem(String title, String amount, Color? color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 13,
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: color,
          ),
        ),
      ],
    );
  }
}
