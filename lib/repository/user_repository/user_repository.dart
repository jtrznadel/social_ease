import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:social_ease/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<UserModel> getUserDetails(String userId) async {
    final snapshot = await _db.collection("users").doc(userId).get();
    final userData = UserModel.fromSnaphot(snapshot);
    return userData;
  }

  Future<void> updateUserRecord(UserModel user) async {
    await _db.collection("users").doc(user.id).update({
      'userName': user.userName,
      'firstName': user.firstName,
      'lastName': user.lastName,
      'phoneNumber': user.phoneNumber,
    });
  }
}
