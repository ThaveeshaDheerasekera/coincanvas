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
    required this.id,
    required this.title,
    required this.description,
    required this.initialAmount,
    required this.total,
    required this.totalIncomes,
    required this.totalExpenses,
    required this.totalDebt,
    required this.totalReceivable,
    required this.createdAt,
  });

  String get formattedDate {
    return DateFormat('dd-MMM-yyyy | HH:mm:ss').format(createdAt);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'initialAmount': initialAmount,
      'total': total,
      'totalIncomes': totalIncomes,
      'totalExpenses': totalExpenses,
      'totalDebt': totalDebt,
      'totalReceivable': totalReceivable,
      'createdAt': createdAt,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map, String documentId) {
    return Book(
      id: documentId,
      title: map['title'] as String,
      description: map['description'] as String,
      initialAmount: map['initialAmount'] as double,
      total: map['total'] as double,
      totalIncomes: map['totalIncomes'] as double,
      totalExpenses: map['totalExpenses'] as double,
      totalDebt: map['totalDebt'] as double,
      totalReceivable: map['totalReceivable'] as double,
      createdAt: map['createdAt'] as DateTime,
    );
  }
}
