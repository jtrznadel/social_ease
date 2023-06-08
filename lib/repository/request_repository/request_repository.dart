import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:social_ease/models/request_model.dart';

class RequestRepository extends GetxController {
  static RequestRepository get instance => Get.find();

  Future<void> createRequest(RequestModel request) async {
    await FirebaseFirestore.instance.collection('requests').add(request.toJson());
  }
}
