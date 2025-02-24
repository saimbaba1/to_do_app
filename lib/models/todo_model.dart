
class TodoModel {
  String docid;
  String userId;
  String title;
  String description;
  String createdAt;
  String time;

  TodoModel(
      {required this.docid,
      required this.userId,
      required this.title,
      required this.description,
      required this.createdAt,
      required this.time});

  // Convert Firestore document to Model
  factory TodoModel.fromFirestore(Map<String, dynamic> data) {
    return TodoModel(
        docid: data['docid'] ?? '',
        userId: data['userId'] ?? '',
        title: data['title'] ?? '',
        description: data['description'] ?? '',
        createdAt: data['createdAt'] ?? '',
        time: data['time'] ?? '');
  }

  // Convert TodoModel to Firestore Document
  Map<String, dynamic> toFirestore() {
    return {
      'docid': docid,
      'userId': userId,
      'title': title,
      'description': description,
      'createdAt': createdAt,
    };
  }
}
