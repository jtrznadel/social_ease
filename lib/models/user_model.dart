import 'package:cloud_firestore/cloud_firestore.dart';

enum Role { admin, user }

class UserModel {
  final String? id;
  final String userName;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String password;

  const UserModel(
      {this.id,
      required this.userName,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phoneNumber,
      required this.password});

  toJson() {
    return {
      "userName": userName,
      "firstName": firstName,
      "lastName": lastName,
      "phoneNumber": phoneNumber,
    };
  }

  factory UserModel.fromSnaphot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
        id: document.id,
        userName: data["userName"],
        firstName: data["firstName"],
        lastName: data["lastName"],
        email: data["email"],
        phoneNumber: data["phoneNumber"],
        password: "●●●●●●●●●");
  }
}
