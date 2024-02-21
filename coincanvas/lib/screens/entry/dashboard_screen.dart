import 'package:coincanvas/configs/constants.dart';
import 'package:coincanvas/configs/custom_colors.dart';
import 'package:coincanvas/models/book.dart';
import 'package:coincanvas/widgets/entry/entry_list_widget.dart';
import 'package:coincanvas/widgets/entry/summery_widget.dart';
import 'package:coincanvas/widgets/global/expandable_text_widget.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  final Book book;
  const DashboardScreen({super.key, required this.book});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _isCollapsed = true;

  @override
  Widget build(BuildContext context) {
    // This is the Dashboard Screen
    return Container(
      // Background color is the same as selected tab color
      color: Colors.black,
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 15),
      height: Constants.screenSize(context).height,
      child: Column(
        children: [
          // Description
          ExpandableTextWidget(
            title: 'Description',
            descriptionWidget: Text(
              widget.book.description.isNotEmpty
                  ? widget.book.description
                  : '- No description -',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: CustomColors.primaryColor.withOpacity(0.5),
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Summery widget is positioned on the top with 15 top padding
          SummeryWidget(book: widget.book),
          // Transaction list is located below the summery widget
          const Expanded(child: EntryListWidget()),
        ],
      ),
    );
  }
}
