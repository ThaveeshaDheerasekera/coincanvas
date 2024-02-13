import 'package:coincanvas/configs/custom_colors.dart';
import 'package:flutter/material.dart';

class SummeryWidget extends StatelessWidget {
  const SummeryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Container(
        height: 120,
        // padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: CustomColors.oliveColor,
          border: Border.all(width: 1, color: Colors.black),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Total Balance: Title and amount
            const Text(
              "Total",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            const Text(
              "136789 LKR",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            // This row containd both total incomes and total expenses
            Container(
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // Total Income Balance: Title and amount
                  Column(
                    children: [
                      const Text(
                        'Income',
                        style: TextStyle(fontSize: 14),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: CustomColors.greenColor,
                        ),
                        // Amount text
                        child: const Text(
                          '123456 LKR',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Total Expence Balance: Title and amount
                  Column(
                    children: [
                      const Text(
                        'Expense',
                        style: TextStyle(fontSize: 14),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: CustomColors.redColor.withOpacity(0.75),
                        ),
                        // Amount text
                        child: const Text(
                          '123456 LKR',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
