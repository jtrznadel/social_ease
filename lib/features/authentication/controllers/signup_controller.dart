import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_ease/repository/authentication_repository/authentication_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final username = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  void registerUser(String email, String password) {
    AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
  }
}
