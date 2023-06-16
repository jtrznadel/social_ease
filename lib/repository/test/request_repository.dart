import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:social_ease/models/request_model.dart';

class RequestRepository extends GetxController {
  RequestRepository({required this.db});

  FirebaseFirestore db;

  Future<String> createRequest(RequestModel request) async {
    final docRef = await db.collection('requests').add(request.toJson());
    await db.collection("requests").doc(docRef.id).update({'id': docRef.id});
    return docRef.id;
  }

  Future<List<RequestModel>> getUserRequests(userId) async {
    final snapshot =
        await db.collection("requests").where("createdBy", isEqualTo: userId).get();
    final requestData = snapshot.docs.map((e) => RequestModel.fromSnapshot(e)).toList();
    return requestData;
  }

  Future<List<RequestModel>> getRequestsByCategory(category) async {
    final snapshot =
        await db.collection("requests").where("category", isEqualTo: category).get();
    final requestData = snapshot.docs.map((e) => RequestModel.fromSnapshot(e)).toList();
    return requestData;
  }

  Future<void> updateRequest(RequestModel request) async {
    await db.collection("requests").doc(request.id).update({
      'category': request.category,
      'description': request.description,
      'location': request.location,
      'title': request.title,
    });
  }

  Future<void> deleteRequest(String requestId) async {
    final docRef = db.collection("requests").doc(requestId);
    final docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      await docRef.delete();
    } else {
      throw Exception("Document does not exist");
    }
  }
}
