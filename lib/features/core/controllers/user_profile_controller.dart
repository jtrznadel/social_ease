import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_ease/repository/authentication_repository/authentication_repository.dart';
import 'package:social_ease/repository/user_repository/user_repository.dart';

import '../../../models/user_model.dart';

class UserProfileController extends GetxController {
  static UserProfileController get instance => Get.find();

  final userName = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phoneNumber = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  getUserData() {
    final userId = _authRepo.firebaseUser.value?.uid;
    if (userId != null) {
      return _userRepo.getUserDetails(userId);
    }
  }

  getFirstname() {
    final userId = _authRepo.firebaseUser.value?.uid;
    if (userId != null) {
      return _userRepo.getFirstname(userId);
    }
  }

  updateRecord(UserModel user) async {
    await _userRepo.updateUserRecord(user);
    Get.back();
    Get.snackbar("Profile Updated", "Profile has been successfully updated");
  }
}
