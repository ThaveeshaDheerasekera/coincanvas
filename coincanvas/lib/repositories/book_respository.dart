// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coincanvas/models/book.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BookRepository extends ChangeNotifier {
  // // Firebase Authentication
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // // Firebase Firestore
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // String? get currentUserId => _firebaseAuth.currentUser?.uid;

  final List<Book> _books = [
    Book(
      title: 'General',
      description:
          'Quisque sollicitudin a lacus et tristique. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Phasellus metus eros, molestie condimentum lacinia vitae, pharetra sed orci. Nam ac neque a urna varius dapibus. Quisque mi massa, maximus non neque vitae, luctus ullamcorper urna. Nulla et faucibus metus.',
      initialAmount: 23425.99,
      createdAt: DateTime.now(),
      totalIncomes: 1092.080,
      totalExpenses: 393.09,
      total: 292.00,
    ),
    Book(
      title: 'Test 2',
      description:
          'Quisque sollicitudin a lacus et tristique. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Phasellus metus eros, molestie condimentum lacinia vitae, pharetra sed orci. Nam ac neque a urna varius dapibus. Quisque mi massa, maximus non neque vitae, luctus ullamcorper urna. Nulla et faucibus metus.',
      initialAmount: 456454.99,
      createdAt: DateTime.now(),
      totalIncomes: 10222.080,
      totalExpenses: 3933.09,
      total: 54392.00,
    ),
    Book(
      title: 'Test 3',
      description:
          'Quisque sollicitudin a lacus et tristique. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Phasellus metus eros, molestie condimentum lacinia vitae, pharetra sed orci. Nam ac neque a urna varius dapibus. Quisque mi massa, maximus non neque vitae, luctus ullamcorper urna. Nulla et faucibus metus.',
      initialAmount: 342342.99,
      createdAt: DateTime.now(),
      totalIncomes: 21392.080,
      totalExpenses: 2323.09,
      total: 45646.00,
    ),
  ];

  List<Book> get bookList {
    return _books;
  }
}
