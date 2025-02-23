import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String userId;
  String name;
  String email;
  String profileImage;

  UserModel({
    required this.userId,
    required this.name,
    required this.email,
    required this.profileImage,
  });

  // Convert Firestore Document to UserModel
  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return UserModel(
      userId: data['userid'] ?? '',
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      profileImage: data['image'] ?? '',
    );
  }

  // Convert UserModel to Firestore Document
  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'image': profileImage,
    };
  }
}
