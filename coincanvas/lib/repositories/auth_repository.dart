import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coincanvas/configs/custom_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthRepository extends ChangeNotifier {
  // Firebase Authentication
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // Firebase Firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get currentUSer => _firebaseAuth.currentUser;
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

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

  // Login function
  Future<void> signInWithEmailAndPassword({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      // Check if all fields are filled
      if (email.isEmpty || password.isEmpty) {
        _showErrorMessage(context, 'Fill all fields!');
        notifyListeners();
        return;
      }

      // Execute login method
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (context.mounted) _showErrorMessage(context, 'SERVER: $e');
      notifyListeners();
    }
  }

  // Sign in function
  Future<void> createUserWithEmailAndPassword({
    required BuildContext context,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      // Check if all fields are filled
      if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
        _showErrorMessage(context, 'Fill all fields!');
        notifyListeners();
        return;
      }

      // Check if the password matches the confirm password field
      if (password != confirmPassword) {
        _showErrorMessage(context, 'Passwords do not match!');
        notifyListeners();
        return;
      }

      // Create user in the firebase authentication
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Get uid from the created user to save
      // in th users collection in firestore
      final uid = userCredential.user?.uid;

      // save user in the users collection in firestore
      await _firestore.collection('users').doc(uid).set({
        'email': email,
      }).onError((e, _) {
        _showErrorMessage(context, 'SERVER: $e');
      });

      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (context.mounted) _showErrorMessage(context, 'SERVER: $e');
      notifyListeners();
    }
  }

  // Sign out function
  Future<void> signOut({
    required BuildContext context,
  }) async {
    try {
      await _firebaseAuth.signOut();
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (context.mounted) _showErrorMessage(context, 'SERVER: $e');
      notifyListeners();
    }
  }
}
