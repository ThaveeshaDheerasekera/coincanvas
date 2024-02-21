import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coincanvas/configs/custom_colors.dart';
import 'package:coincanvas/models/book.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BookRepository extends ChangeNotifier {
  // // Firebase Authentication
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // // Firebase Firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get logged in user's userId
  String? get currentUserId => _firebaseAuth.currentUser?.uid;

  List<Book> _books = [];

  List<Book> get bookList {
    return _books;
  }

  // Show error message function
  void _showErrorMessage(BuildContext context, String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          errorMessage,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        backgroundColor: CustomColors.oliveColor,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  // Fetch book list
  Future<List<Book>> fetchBookList() async {
    // Fetch users collection, get logged in user with userId,
    // fetch books list of that user and order by the created DateTime
    _firestore
        .collection('users')
        .doc(currentUserId)
        .collection('books')
        .orderBy('createdAt')
        .snapshots(includeMetadataChanges: true)
        .listen((event) {
      _books = event.docs.map((e) => Book.fromMap(e.data(), e.id)).toList();
      notifyListeners();
    });

    return _books;
  }

  // Create a new book
  Future<void> createBook({
    required BuildContext context,
    required String title,
    required String description,
    required String currency,
  }) async {
    try {
      // Query Firestore to check if a book with the same title already exists
      QuerySnapshot querySnapshot = await _firestore
          .collection('users/${currentUserId!}/books')
          .where('title', isEqualTo: title)
          .get();

      // If the query has documents, then the title is not unique
      // Thus execute the else block, otherwise create a new book
      if (querySnapshot.docs.isEmpty) {
        await _firestore.collection('users/${currentUserId!}/books').add({
          'title': title,
          'description': description,
          'currency': currency,
          'total': 0.00,
          'totalIncomes': 0.00,
          'totalExpenses': 0.00,
          'totalDebt': 0.00,
          'totalReceivable': 0.00,
          'createdAt': DateTime.now(),
        });
        notifyListeners();
      } else {
        // If title is not unique, print an error and complete with an error message
        if (context.mounted) {
          _showErrorMessage(context, 'Title must be unique');
        }
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) _showErrorMessage(context, 'SERVER: ${e.message}');
    } on FirebaseException catch (e) {
      if (context.mounted) _showErrorMessage(context, 'SERVER: ${e.message}');
    } catch (e) {
      if (context.mounted) _showErrorMessage(context, 'SERVER: $e');
    }
  }
}
