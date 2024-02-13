import 'package:coincanvas/configs/constants.dart';
import 'package:coincanvas/configs/custom_colors.dart';
import 'package:coincanvas/widgets/home/home_screen_list_widget.dart';
import 'package:flutter/material.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  @override
  Widget build(BuildContext context) {
    // This is the Dashboard Screen
    return Container(
      // Background color is the same as selected tab color
      color: CustomColors.oliveColor,
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      height: Constants.screenSize(context).height,
      child: const HomeScreenListWidget(),
    );
  }
}
