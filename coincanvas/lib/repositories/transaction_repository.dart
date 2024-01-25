// // import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:coincanvas/models/transaction.dart';
// import 'package:extrack/models/transaction.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';


// class TransactionRepository extends ChangeNotifier {
//   // // Firebase Authentication
//   // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   // // Firebase Firestore
//   // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   // String? get currentUserId => _firebaseAuth.currentUser?.uid;

//   List<Flux> _transactions = [];

//   List<Transactions> get getTransactions {
//     return _transactions;
//   }

//   // Function to create a new note
//   Future<void> createNote(Transactions transaction) async {
//     try {
//       await _firestore.collection('users/${currentUserId!}/transactions').add({
//         'id': transaction.id,
//         'title': transaction.title,
//         'description': transaction.description,
//         'amount': transaction.amount,
//         'dateTime': Timestamp.fromDate(transaction.dateTime),
//         'category': transaction.category
//             .toString(), // You may need to adjust this based on your Category class
//         'type': transaction.type
//             .toString(), // You may need to adjust this based on your Type enum
//         'paymentMethod': transaction.paymentMethod
//             .toString(), // You may need to adjust this based on your PaymentMethod enum
//         'isCollapsed': transaction.isCollapsed,
//       });
//     } catch (e) {
//       // Handle errors
//       print('Error creating note: $e');
//     }
//   }
// }
