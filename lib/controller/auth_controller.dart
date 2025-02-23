import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/utils/snackbar_util.dart';
import 'package:to_do_app/view/auth/signin_screen.dart';
import 'package:to_do_app/view/user/home_scree.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  Future signup(
    GlobalKey<FormState> formKey,
    TextEditingController emailController,
    TextEditingController passwordController,
  ) async {
    try {
      if (formKey.currentState!.validate()) {
        isLoading.value = true;

        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);

        Get.offAll(() => AddToHome());
        SnackbarUtil.showSuccess('Registration successful');
      }
    } catch (e) {
      SnackbarUtil.showError(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future signin(
      GlobalKey<FormState> formKey,
      TextEditingController emailController,
      TextEditingController passwordController) async {
    try {
      if (formKey.currentState!.validate()) {
        isLoading.value = true;

        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);

        Get.offAll(() => AddToHome());
        SnackbarUtil.showSuccess('Sign-in successful');
        isLoading.value = false;
      }
    } catch (e) {
      SnackbarUtil.showError(e.toString());
      isLoading.value = false;
    }
  }

  Future forgetPassword(GlobalKey<FormState> formKey,
      TextEditingController emailController) async {
    try {
      if (formKey.currentState!.validate()) {
        isLoading.value = true;

        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: emailController.text);

        Get.to(() => SigninScreen());
        SnackbarUtil.showSuccess('Password reset link has been sent');
      }
    } catch (e) {
      SnackbarUtil.showError(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future Logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => SigninScreen());
    } catch (e) {
      SnackbarUtil.showError("Logout failed".toString());
    }
  }
}
