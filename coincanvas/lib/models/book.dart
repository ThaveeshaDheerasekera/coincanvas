import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

class Book {
  final String id;
  final String title;
  final String description;
  final String currency;
  final double total;
  final double totalIncomes;
  final double totalExpenses;
  final double totalDebts;
  final double totalReceivables;
  final DateTime createdAt;

  Book({
    required this.id,
    required this.title,
    required this.description,
    required this.currency,
    required this.total,
    required this.totalIncomes,
    required this.totalExpenses,
    required this.totalDebts,
    required this.totalReceivables,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'currency': currency,
      'total': total,
      'totalIncomes': totalIncomes,
      'totalExpenses': totalExpenses,
      'totalDebt': totalDebts,
      'totalReceivable': totalReceivables,
      'createdAt': createdAt,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map, String documentId) {
    return Book(
      id: documentId,
      title: map['title'] as String? ?? '',
      description: map['description'] as String? ?? '',
      currency: map['currency'] as String? ?? '',
      total: (map['total'] as num?)?.toDouble() ?? 0.0,
      totalIncomes: (map['totalIncomes'] as num?)?.toDouble() ?? 0.0,
      totalExpenses: (map['totalExpenses'] as num?)?.toDouble() ?? 0.0,
      totalDebts: (map['totalDebt'] as num?)?.toDouble() ?? 0.0,
      totalReceivables: (map['totalReceivable'] as num?)?.toDouble() ?? 0.0,
      createdAt: (map['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }
}
