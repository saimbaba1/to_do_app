import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  String docid;
  String userid;
  String title;
  String description;
  DateTime? createdAt;

  TodoModel({
    required this.docid,
    required this.userid,
    required this.title,
    required this.description,
    this.createdAt,
  });

  // Convert Firestore Document to TodoModel
  factory TodoModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return TodoModel(
      docid: data['docid'] ?? '',
      userid: data['userid'] ?? '',
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      createdAt: data['createdAt'] != null
          ? (data['createdAt'] as Timestamp).toDate()
          : null,
    );
  }

  // Convert TodoModel to Firestore Document
  Map<String, dynamic> toFirestore() {
    return {
      'docid': docid,
      'userid': userid,
      'title': title,
      'description': description,
      'createdAt': createdAt != null ? Timestamp.fromDate(createdAt!) : null,
    };
  }
}
