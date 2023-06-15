import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_ease/models/user_model.dart';
import 'package:social_ease/repository/authentication_repository/authentication_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  bool isPasswordObscured = true;
  bool isConfirmPasswordObscured = true;

  final username = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  void registerUser(UserModel user) {
    AuthenticationRepository.instance.createUserWithEmailAndPassword(user);
  }

  bool arePasswordsSame(String password, String confirmPassword) {
    return AuthenticationRepository.instance.arePasswordsSame(password, confirmPassword);
  }
}
