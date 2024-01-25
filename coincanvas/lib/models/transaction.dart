import 'package:coincanvas/configs/constants.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

class Flux {
  final String id;
  final String title;
  final String description;
  final double amount;
  final DateTime dateTime;
  final Category category;
  final Type type;
  final PaymentMethod paymentMethod;
  bool isCollapsed;

  Flux({
    required this.title,
    required this.description,
    required this.amount,
    required this.dateTime,
    required this.category,
    required this.type,
    required this.paymentMethod,
    this.isCollapsed = false,
  }) : id = uuid.v4();

  String get formattedDate {
    return DateFormat('dd-MMM-yyyy | HH:mm:ss').format(dateTime);
  }
}
