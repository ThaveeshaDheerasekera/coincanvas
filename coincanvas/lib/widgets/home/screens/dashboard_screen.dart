import 'package:coincanvas/configs/constants.dart';
import 'package:coincanvas/configs/custom_colors.dart';
import 'package:coincanvas/widgets/home/home_screen_list_widget.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.background,
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      height: Constants.screenSize(context).height,
      child: Stack(
        children: [
          const HomeScreenListWidget(),
          Positioned(
            top: 15,
            left: 0,
            right: 0,
            child: Container(
              // height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 7),
              decoration: BoxDecoration(
                color: CustomColors.lightMossGreen,
                border:
                    Border.all(width: 1, color: Colors.grey.withOpacity(0.5)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  summeryItem('Total', '130,009', Colors.black),
                  summeryItem('Income', '136,000', Colors.green),
                  summeryItem('Expense', '136,000', Colors.red),
                ],
              ),
            ),
          ),
        ],
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
