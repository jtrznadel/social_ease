import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_ease/repository/authentication_repository/authentication_repository.dart';

class LogInController extends GetxController {
  static LogInController get instance => Get.find();

  bool isPasswordObscured = true;

  final email = TextEditingController();
  final password = TextEditingController();

  void loginUser(String email, String password) {
    AuthenticationRepository.instance.loginUserWithEmailAndPassword(email, password);
  }

  void logoutUser() {
    AuthenticationRepository.instance.logout();
  }
}
