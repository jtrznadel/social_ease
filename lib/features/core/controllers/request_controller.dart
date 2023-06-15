import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_ease/features/core/navigation_profile.dart';
import 'package:social_ease/models/request_model.dart';
import 'package:social_ease/repository/authentication_repository/authentication_repository.dart';
import 'package:social_ease/repository/request_repository/request_repository.dart';

import '../screens/requests/request_details_screen.dart';

class RequestController extends GetxController {
  static RequestController get instance => Get.find();

  final _requestRepo = Get.put(RequestRepository());
  final _authRepo = Get.put(AuthenticationRepository());

  final title = TextEditingController();
  final description = TextEditingController();
  final location = TextEditingController();
  final category = TextEditingController();

  createRequest(RequestModel request) {
    _requestRepo.createRequest(request);
  }

  getUserId() {
    return _authRepo.getUserId();
  }

  getUserRequestsData() {
    final userId = _authRepo.getUserId();
    return _requestRepo.getUserRequests(userId);
  }

  getRequestsByCategory(String category) {
    return _requestRepo.getRequestsByCategory(category);
  }

  updateRequest(RequestModel request) async {
    await _requestRepo.updateRequest(request);
    Get.to(() => RequestDetailsScreen(requestModel: request));

    Get.snackbar("Request Updated", "Request has been successfully updated",
        margin: const EdgeInsets.all(10), backgroundColor: Colors.green.withOpacity(0.4));
  }

  deleteRequest(String requestId) async {
    await _requestRepo.deleteRequest(requestId);
    Get.to(() => const NavigationProfile());

    Get.snackbar("Request Deleted", "Request has been successfully deleted",
        margin: const EdgeInsets.all(10), backgroundColor: Colors.green.withOpacity(0.4));
  }
}
