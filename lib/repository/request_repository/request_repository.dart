import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:social_ease/models/request_model.dart';

class RequestRepository extends GetxController {
  static RequestRepository get instance => Get.find();

  Future<void> createRequest(RequestModel request) async {
    await FirebaseFirestore.instance.collection('requests').add(request.toJson());
  }

  Future<List<RequestModel>> getUserRequests(userId) async {
    final snapshot = await FirebaseFirestore.instance
        .collection("requests")
        .where("createdBy", isEqualTo: userId)
        .get();
    final requestData = snapshot.docs.map((e) => RequestModel.fromSnapshot(e)).toList();
    return requestData;
  }

  Future<List<RequestModel>> getRequestsByCategory(category) async {
    final snapshot = await FirebaseFirestore.instance
        .collection("requests")
        .where("category", isEqualTo: category)
        .get();
    final requestData = snapshot.docs.map((e) => RequestModel.fromSnapshot(e)).toList();
    return requestData;
  }
}
