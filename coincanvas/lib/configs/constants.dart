import 'package:flutter/material.dart';

class Constants {
  // screen size
  static Size screenSize(BuildContext context) => MediaQuery.of(context).size;

  static const categoryIcons = {
    Category.Food: Icons.lunch_dining,
    Category.Travel: Icons.flight_takeoff,
    Category.Entertainment: Icons.theater_comedy,
    Category.Work: Icons.business_center,
    Category.Health: Icons.favorite,
    Category.Other: Icons.category
  };

  static const typeIcons = {
    Type.Income: Icons.arrow_circle_up,
    Type.Expense: Icons.arrow_circle_down,
  };
}

// Transaction category
// ignore: constant_identifier_names
enum Category { Food, Travel, Entertainment, Work, Health, Other }

// Transaction type
// ignore: constant_identifier_names
enum Type { Income, Expense, Debt, Receivable }

// Payment methods
// ignore: constant_identifier_names
enum PaymentMethod { Cash, CreditCard, DebitCard, BankTransfer }
