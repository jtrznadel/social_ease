import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:social_ease/features/authentication/screens/login/login_screen.dart';
import 'package:social_ease/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:social_ease/models/user_model.dart';
import 'package:social_ease/repository/authentication_repository/exceptions/signup_email_password_failure.dart';

import '../../features/core/navigation_profile.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
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
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  Future<void> loginUserWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (_) {}
  }

  Future<void> logout() async => await _auth.signOut();

  String getUserId() {
    User? user = FirebaseAuth.instance.currentUser;
    String userId = user?.uid ?? '';
    return userId;
  }
}
