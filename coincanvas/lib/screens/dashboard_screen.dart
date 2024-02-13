import 'package:coincanvas/configs/constants.dart';
import 'package:coincanvas/configs/custom_colors.dart';
import 'package:coincanvas/widgets/home/home_screen_list_widget.dart';
import 'package:coincanvas/widgets/home/summery_widget.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    // This is the Dashboard Screen
    return Container(
      // Background color is the same as selected tab color
      color: Colors.black,
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      height: Constants.screenSize(context).height,
      child: const Stack(
        children: [
          // Transaction list is located below the summery widget
          HomeScreenListWidget(),
          // Summery widget is positioned on the top with 15 top padding
          Positioned(
            top: 15,
            left: 0,
            right: 0,
            child: SummeryWidget(),
          ),
        ],
      ),
    );
  }
}
