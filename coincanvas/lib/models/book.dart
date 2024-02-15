import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

class Book {
  final String id;
  final String title;
  final String description;
  final double initialAmount;
  final double total;
  final double totalIncomes;
  final double totalExpenses;
  final double totalDebt;
  final double totalReceivable;
  final DateTime createdAt;

  Book({
    required this.title,
    required this.description,
    required this.initialAmount,
    required this.total,
    required this.totalIncomes,
    required this.totalExpenses,
    required this.totalDebt,
    required this.totalReceivable,
    required this.createdAt,
  }) : id = uuid.v4();

  String get formattedDate {
    return DateFormat('dd-MMM-yyyy | HH:mm:ss').format(createdAt);
  }
}
