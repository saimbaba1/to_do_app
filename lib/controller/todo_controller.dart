import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/view/user/home_scree.dart';

class TodoController extends GetxController {
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
        await docRef.set({
          'docid': docRef.id,
          'title': TitleController.text,
          'description': DescriptionController.text,
          'time': DateTime.now().toString(),
          "userid": user!.uid.toString()
        });
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
}
