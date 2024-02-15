import 'package:coincanvas/configs/custom_colors.dart';
import 'package:coincanvas/widgets/global/summery_item_widget.dart';
import 'package:flutter/material.dart';

class SummeryWidget extends StatelessWidget {
  const SummeryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 280,
          decoration: const BoxDecoration(color: Colors.black),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Total Balance: Title and amount
              SummeryItemWidget(
                  title: 'Total',
                  amount: 1000000000000,
                  color: CustomColors.blueColor),
              // Total Incomes: Title and amount
              SummeryItemWidget(
                  title: 'Income',
                  amount: 673445,
                  color: CustomColors.greenColor),
              // Total Expenses: Title and amount
              SummeryItemWidget(
                  title: 'Expense',
                  amount: 12345,
                  color: CustomColors.redColor),
              // Total Debts: Title and amount
              SummeryItemWidget(
                  title: 'Debt',
                  amount: 34545,
                  color: CustomColors.orangeColor),
              // Total Receivable Amount: Title and amount
              SummeryItemWidget(
                  title: 'Receivable',
                  amount: 98745,
                  color: CustomColors.yellowColor),
            ],
          ),
        ),
        // All Entries text
        Container(
          height: 200,
          width: double.infinity,
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(vertical: 5),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: CustomColors.primaryColor)),
          child: Text(
            'TODO: Add a chart here',
            style: TextStyle(
              color: CustomColors.primaryColor,
              fontSize: 14,
            ),
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
