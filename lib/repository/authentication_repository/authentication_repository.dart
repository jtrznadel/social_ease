import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_ease/features/authentication/screens/login/login_screen.dart';
import 'package:social_ease/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:social_ease/models/user_model.dart';
import 'package:social_ease/repository/authentication_repository/exceptions/signup_email_password_failure.dart';

import '../../features/core/navigation_profile.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser = Rx<User?>(_auth.currentUser);

  @override
  void onReady() {
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const WelcomeScreen())
        : Get.offAll(() => const NavigationProfile());
  }

  Future<void> createUserWithEmailAndPassword(UserModel userModel) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: userModel.email, password: userModel.password);
      User? userToDoc = result.user;
      await FirebaseFirestore.instance.collection('users').doc(userToDoc!.uid).set({
        'userName': userModel.userName,
        'firstName': userModel.firstName,
        'lastName': userModel.lastName,
        'email': userModel.email,
        'phoneNumber': userModel.phoneNumber,
      });
      firebaseUser.value != null
          ? Get.offAll(() => const LoginScreen())
          : Get.to(() => const WelcomeScreen());
      Get.snackbar("User registered", "User has been successfully registered",
          margin: const EdgeInsets.all(10),
          backgroundColor: Colors.green.withOpacity(0.3));
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      Get.snackbar("Something went wrong", ex.message,
          margin: const EdgeInsets.all(10), backgroundColor: Colors.red.withOpacity(0.3));
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  Future<void> loginUserWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      Get.snackbar("Something went wrong", ex.message,
          margin: const EdgeInsets.all(10), backgroundColor: Colors.red.withOpacity(0.3));
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  Future<void> logout() async => await _auth.signOut();

  String getUserId() {
    User? user = FirebaseAuth.instance.currentUser;
    String userId = user?.uid ?? '';
    return userId;
  }

  bool arePasswordsSame(String password, String confirmPassword) {
    if (password == confirmPassword) {
      return true;
    }
    Get.snackbar("Something went wrong", "Passwords are not equal",
        margin: const EdgeInsets.all(10), backgroundColor: Colors.red.withOpacity(0.3));
    return false;
  }
}
