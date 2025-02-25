import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/models/todo_model.dart';
import 'package:to_do_app/models/user_model.dart';
import 'package:to_do_app/view/user/home_scree.dart';

class TodoController extends GetxController {
  RxList<TodoModel> todoList = <TodoModel>[].obs;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  RxList<UserModel> userInfoList = <UserModel>[].obs;
  @override
  void onReady() {
    super.onReady();
    fetchTodos();
  }

  RxBool isLoading = false.obs;
  Future addto(
    GlobalKey<FormState> _formKey,
    TextEditingController TitleController,
    TextEditingController DescriptionController,
  ) async {
    if (_formKey.currentState!.validate()) {
      try {
        isLoading.value = true;
        User? user = FirebaseAuth.instance.currentUser;
        DocumentReference docRef =
            FirebaseFirestore.instance.collection('todo').doc();
        TodoModel todoModel = TodoModel(
          time: DateTime.now().toString(),
          createdAt: DateTime.now().toString(),
          docid: docRef.id,
          title: TitleController.text,
          description: DescriptionController.text,
          userId: user!.uid.toString(),
        );

        await docRef.set(todoModel.toFirestore());
        isLoading.value = false;
        Get.to(AddToHome());
      } catch (e) {
        Get.snackbar('error', e.toString());
        isLoading.value = false;
      }
    }
  }

  Future delete(String docId) async {
    try {
      await FirebaseFirestore.instance.collection('todo').doc(docId).delete();
    } catch (e) {
      Get.snackbar("error", e.toString());
    }
  }

  Future updates(
    String docId,
    TextEditingController titleController,
    TextEditingController descriptionController,
  ) async {
    try {
      isLoading.value = true;

      await FirebaseFirestore.instance.collection('todo').doc(docId).update({
        'title': titleController.text,
        'description': descriptionController.text,
      });

      Get.back();
      isLoading.value = false;
    } catch (e) {
      Get.snackbar('error', e.toString());
      isLoading.value = false;
    }
  }

  Future fetchTodos() async {
    try {
      isLoading.value = true;
      String userId = FirebaseAuth.instance.currentUser!.uid;

      QuerySnapshot snapshot = await _firestore
          .collection('todo')
          .where('userId', isEqualTo: userId)
          .get();

      List<TodoModel> fetchedTodos = snapshot.docs.map((doc) {
        return TodoModel.fromFirestore(doc.data() as Map<String, dynamic>);
      }).toList();
      print(fetchedTodos.first.title);
      todoList.assignAll(fetchedTodos);
    } catch (e) {
      print("Error fetching todos: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
