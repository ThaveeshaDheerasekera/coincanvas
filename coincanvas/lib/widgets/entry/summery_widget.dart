import 'package:coincanvas/configs/custom_colors.dart';
import 'package:coincanvas/models/book.dart';
import 'package:coincanvas/widgets/global/summery_item_widget.dart';
import 'package:flutter/material.dart';

class SummeryWidget extends StatefulWidget {
  final Book book;
  const SummeryWidget({super.key, required this.book});

  @override
  State<SummeryWidget> createState() => _SummeryWidgetState();
}

class _SummeryWidgetState extends State<SummeryWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(color: Colors.black),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Total Balance: Title and amount
              SummeryItemWidget(
                  title: 'Total',
                  amount: widget.book.total,
                  currency: widget.book.currency,
                  color: CustomColors.blueColor),
              // Total Incomes: Title and amount
              SummeryItemWidget(
                  title: 'Total Incomes',
                  amount: widget.book.totalIncomes,
                  currency: widget.book.currency,
                  color: CustomColors.greenColor),
              // Total Expenses: Title and amount
              SummeryItemWidget(
                  title: 'Total Expenses',
                  amount: widget.book.totalExpenses,
                  currency: widget.book.currency,
                  color: CustomColors.redColor),
              // Total Debts: Title and amount
              SummeryItemWidget(
                  title: 'Total Debts',
                  amount: widget.book.totalDebts,
                  currency: widget.book.currency,
                  color: CustomColors.orangeColor),
              // Total Receivable Amount: Title and amount
              SummeryItemWidget(
                  title: 'Total Receivables',
                  amount: widget.book.totalReceivables,
                  currency: widget.book.currency,
                  color: CustomColors.yellowColor),
            ],
          ),
        ),
        // All Entries text
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 5),
          alignment: Alignment.center,
          child: Text(
            'All Entries',
            style: TextStyle(
              color: CustomColors.primaryColor,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
