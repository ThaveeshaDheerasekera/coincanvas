import 'package:coincanvas/configs/custom_colors.dart';
import 'package:flutter/material.dart';

class SummeryItemWidget extends StatelessWidget {
  final String title;
  final double amount;
  final String currency;
  final Color color;
  const SummeryItemWidget({
    super.key,
    required this.title,
    required this.amount,
    required this.currency,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          // Amount text
          child: Text(
            '$amount $currency',
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
        ),
      ),
    ]);
  }
}
