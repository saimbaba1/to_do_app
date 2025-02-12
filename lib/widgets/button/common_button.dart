import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/constant/app_colors.dart';

class CommonButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isLoading;
  const CommonButton({
    super.key,
    required this.title,
    required this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 50.h,
          width: 220.w,
          color: AppColors.color1,
          alignment: Alignment.center,
          child: isLoading == true
              ? CircularProgressIndicator(
                  color: AppColors.color2,
                )
              : Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: AppColors.color2,
                      fontFamily: "Poppins"),
                )),
    );
  }
}
