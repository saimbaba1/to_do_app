import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:to_do_app/constant/app_colors.dart';

class LoadingUtil {
  // ✅ Button Loading Widget
  static Widget buttonLoading(
      {double size = 20, Color color = AppColors.color2}) {
    return SizedBox(
      height: size,
      width: size,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: AppColors.color2,
      ),
    );
  }

  // ✅ Show Loading Dialog
  static void showLoadingDialog({String message = "Please wait..."}) {
    Get.dialog(
      AlertDialog(
        backgroundColor: AppColors.color2,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(color: AppColors.color1),
            SizedBox(height: 16.h),
            Text(message, style: TextStyle(fontSize: 16.sp)),
          ],
        ),
      ),
      barrierDismissible: false,
    );
  }

  // ✅ Hide Dialog
  static void hideLoadingDialog() {
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }

  static Widget shimmerTile(
      {double height = 80, double width = double.infinity, int? itemcount}) {
    return Expanded(
      child: ListView.builder(
        itemCount: itemcount, // Number of shimmer placeholders
        itemBuilder: (context, _) => Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: height,
            width: width,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
