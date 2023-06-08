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
}
