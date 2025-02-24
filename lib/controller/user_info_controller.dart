import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/models/user_model.dart';
import 'package:to_do_app/utils/snackbar_util.dart';

class UserInfoController extends GetxController {
  RxBool isLoading = false.obs;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  RxList<UserModel> userInfoList = <UserModel>[].obs;
  Future addUserInfo(TextEditingController nameController,
      TextEditingController emailController) async {
    isLoading.value = true;
    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;

      UserModel userModel = UserModel(
        userId: userId,
        name: nameController.text,
        email: emailController.text,
        profileImage: '',
      );

      await FirebaseFirestore.instance
          .collection('userprofile')
          .doc(userId)
          .set(userModel.toFirestore());
    } catch (e) {}
  }

  Future updateUSerInfo(TextEditingController nameController) async {
    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance
          .collection('userprofile')
          .doc(userId)
          .update({
        'name': nameController.text,
      });

      Get.back();
      SnackbarUtil.showSuccess('Profile updated successfully');
    } catch (e) {
      SnackbarUtil.showError('Error updating profile'.toString());
    }
  }

  Future userprofile() async {
    try {
      isLoading.value = true;
      String userId = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot documentSnapshot =
          await _firestore.collection('userprofile').doc(userId).get();
      UserModel data = UserModel.fromFirestore(documentSnapshot);
      userInfoList.assignAll([data]);
      return data;
    } catch (e) {
      print("No Profile: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
