import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constant/app_colors.dart';
import 'package:to_do_app/constant/app_icons.dart';

class SnackbarUtil {
  static void showSuccess(String message, {String title = "Success"}) {
    _showSnackbar(title, message, AppColors.color2, AppIcons.checkCircle);
  }

  static void showError(String message, {String title = "Error"}) {
    _showSnackbar(title, message, AppColors.color8, AppIcons.error);
  }

  static void showWarning(String message, {String title = "Warning"}) {
    _showSnackbar(title, message, AppColors.color5, AppIcons.Warning);
  }

  static void _showSnackbar(
      String title, String message, Color color, IconData icon) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: color.withOpacity(.9),
      colorText: AppColors.color2,
      icon: Icon(icon, color: AppColors.color2),
      margin: const EdgeInsets.all(10),
      borderRadius: 10,
      duration: const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 500),
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
}
