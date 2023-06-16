import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:social_ease/models/user_model.dart';

class AuthenticationRepository extends GetxController {
  AuthenticationRepository({required this.auth});

  final FirebaseAuth auth;
  late final firebaseUser = auth.currentUser;

  Future<void> createUserWithEmailAndPassword(UserModel userModel) async {
    UserCredential result = await auth.createUserWithEmailAndPassword(
        email: userModel.email, password: userModel.password);
    User? userToDoc = result.user;
    await FirebaseFirestore.instance.collection('users').doc(userToDoc!.uid).set({
      'userName': userModel.userName,
      'firstName': userModel.firstName,
      'lastName': userModel.lastName,
      'email': userModel.email,
      'phoneNumber': userModel.phoneNumber,
    });
  }

  Future<void> loginUserWithEmailAndPassword(String email, String password) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> logout() async => await auth.signOut();

  String getUserId() {
    User? user = FirebaseAuth.instance.currentUser;
    String userId = user?.uid ?? '';
    return userId;
  }

  bool arePasswordsSame(String password, String confirmPassword) {
    if (password == confirmPassword) {
      return true;
    }

    return false;
  }
}
