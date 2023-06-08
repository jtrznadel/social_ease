import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_ease/models/request_model.dart';
import 'package:social_ease/repository/authentication_repository/authentication_repository.dart';
import 'package:social_ease/repository/request_repository/request_repository.dart';

class RequestController extends GetxController {
  static RequestController get instance => Get.find();

  final _requestRepo = Get.put(RequestRepository());
  final _authRepo = Get.put(AuthenticationRepository());

  final title = TextEditingController();
  final description = TextEditingController();
  final location = TextEditingController();

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
}
