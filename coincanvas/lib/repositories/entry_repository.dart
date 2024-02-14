// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coincanvas/configs/constants.dart';
import 'package:coincanvas/models/entry.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EntryRepository extends ChangeNotifier {
  // // Firebase Authentication
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // // Firebase Firestore
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // String? get currentUserId => _firebaseAuth.currentUser?.uid;

  final List<Entry> _entries = [
    Entry(
        title: 'Test 1',
        description:
            'Quisque sollicitudin a lacus et tristique. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Phasellus metus eros, molestie condimentum lacinia vitae, pharetra sed orci. Nam ac neque a urna varius dapibus. Quisque mi massa, maximus non neque vitae, luctus ullamcorper urna. Nulla et faucibus metus.',
        amount: 100000000000000000.99,
        createdAt: DateTime.now(),
        category: Category.Work,
        type: Type.Expense,
        paymentMethod: PaymentMethod.BankTransfer),
    Entry(
        title: 'Test 1',
        description:
            'Quisque sollicitudin a lacus et tristique. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Phasellus metus eros, molestie condimentum lacinia vitae, pharetra sed orci. Nam ac neque a urna varius dapibus. Quisque mi massa, maximus non neque vitae, luctus ullamcorper urna. Nulla et faucibus metus.',
        amount: 10.99,
        createdAt: DateTime.now(),
        category: Category.Work,
        type: Type.Expense,
        paymentMethod: PaymentMethod.BankTransfer),
    Entry(
        title: 'Test 1',
        description:
            'Quisque sollicitudin a lacus et tristique. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Phasellus metus eros, molestie condimentum lacinia vitae, pharetra sed orci. Nam ac neque a urna varius dapibus. Quisque mi massa, maximus non neque vitae, luctus ullamcorper urna. Nulla et faucibus metus.',
        amount: 10.99,
        createdAt: DateTime.now(),
        category: Category.Work,
        type: Type.Expense,
        paymentMethod: PaymentMethod.BankTransfer),
    Entry(
        title: 'Test 1',
        description:
            'Quisque sollicitudin a lacus et tristique. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Phasellus metus eros, molestie condimentum lacinia vitae, pharetra sed orci. Nam ac neque a urna varius dapibus. Quisque mi massa, maximus non neque vitae, luctus ullamcorper urna. Nulla et faucibus metus.',
        amount: 10.99,
        createdAt: DateTime.now(),
        category: Category.Work,
        type: Type.Expense,
        paymentMethod: PaymentMethod.BankTransfer),
    Entry(
        title: 'Test 2',
        description: '',
        amount: 11.99,
        createdAt: DateTime.now(),
        category: Category.Work,
        type: Type.Income,
        paymentMethod: PaymentMethod.Cash),
    Entry(
        title: 'Test 3',
        description:
            'Quisque sollicitudin a lacus et tristique. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Phasellus metus eros, molestie condimentum lacinia vitae, pharetra sed orci. Nam ac neque a urna varius dapibus. Quisque mi massa, maximus non neque vitae, luctus ullamcorper urna. Nulla et faucibus metus.',
        amount: 13.99,
        createdAt: DateTime.now(),
        category: Category.Work,
        type: Type.Expense,
        paymentMethod: PaymentMethod.CreditCard),
    Entry(
        title: 'Test 4',
        description: '',
        amount: 140000.99,
        createdAt: DateTime.now(),
        category: Category.Work,
        type: Type.Income,
        paymentMethod: PaymentMethod.DebitCard),
    Entry(
        title: 'Test 5',
        description: '',
        amount: 140560.99,
        createdAt: DateTime.now(),
        category: Category.Work,
        type: Type.Debt,
        paymentMethod: PaymentMethod.DebitCard),
    Entry(
        title: 'Test 6',
        description: '',
        amount: 23000.99,
        createdAt: DateTime.now(),
        category: Category.Health,
        type: Type.Receivable,
        paymentMethod: PaymentMethod.DebitCard),
  ];
  final List<Entry> _incomeEntries = [];
  final List<Entry> _expenseEntries = [];

  List<Entry> get entiresList {
    return _entries;
  }

  List<Entry> get incomeEntriesList {
    // Clear the list before populating it
    _incomeEntries.clear();

    // Use the `where` method to filter entries with type `Income`
    _incomeEntries.addAll(_entries.where((entry) => entry.type == Type.Income));

    return _incomeEntries;
  }

  List<Entry> get expenseEntriesList {
    // Clear the list before populating it
    _expenseEntries.clear();

    // Use the `where` method to filter entries with type `Income`
    _expenseEntries
        .addAll(_entries.where((entry) => entry.type == Type.Expense));

    return _expenseEntries;
  }
}
