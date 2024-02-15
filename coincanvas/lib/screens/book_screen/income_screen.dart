import 'package:coincanvas/configs/constants.dart';
import 'package:coincanvas/configs/custom_colors.dart';
import 'package:coincanvas/widgets/book_screen/entry_list_widget.dart';
import 'package:flutter/material.dart';

class IncomeScreen extends StatefulWidget {
  const IncomeScreen({super.key});

  @override
  State<IncomeScreen> createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen> {
  @override
  Widget build(BuildContext context) {
    // This is the Dashboard Screen
    return Container(
      // Background color is the same as selected tab color
      color: CustomColors.oliveColor,
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      height: Constants.screenSize(context).height,
      child: const EntryListWidget(),
    );
  }
}
