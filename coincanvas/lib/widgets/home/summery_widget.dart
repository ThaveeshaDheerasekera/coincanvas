import 'package:coincanvas/configs/custom_colors.dart';
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
              summeryItem('Total', '4,237,420,472', CustomColors.blueColor),
              // Total Incomes: Title and amount
              summeryItem('Income', '673,445', CustomColors.greenColor),
              // Total Expenses: Title and amount
              summeryItem('Expense', '12,345', CustomColors.redColor),
              // Total Debts: Title and amount
              summeryItem('Debt', '345,45', CustomColors.orangeColor),
              // Total Receivable Amount: Title and amount
              summeryItem('Receivable', '98,745', CustomColors.yellowColor),
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

  Column summeryItem(String title, String amount, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: CustomColors.primaryColor,
            fontSize: 14,
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: CustomColors.primaryColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            // Amount text
            child: Text(
              '$amount LKR',
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
