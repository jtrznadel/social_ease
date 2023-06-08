import 'package:cloud_firestore/cloud_firestore.dart';

class RequestModel {
  final String? id;
  final String title;
  final String description;
  final String category;
  final String location;
  final String createdAt;
  final String createdBy;

  const RequestModel(
      {this.id,
      required this.title,
      required this.description,
      required this.category,
      required this.location,
      required this.createdAt,
      required this.createdBy});

  toJson() {
    return {
      "title": title,
      "description": description,
      "category": category,
      "location": location,
      "createdAt": createdAt,
      "createdBy": createdBy,
    };
  }

  factory RequestModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return RequestModel(
        title: data['title'],
        description: data["description"],
        category: data["category"],
        location: data["location"],
        createdAt: data["createdAt"],
        createdBy: data["createdBy"]);
  }
}
