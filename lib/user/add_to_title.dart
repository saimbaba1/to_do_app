import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constant/app_colors.dart';
import 'package:to_do_app/constant/app_icons.dart';
import 'package:to_do_app/user/add_to_do_update.dart';

class AddToTitle extends StatefulWidget {
  const AddToTitle({super.key});

  @override
  State<AddToTitle> createState() => _AddToTitleState();
}

class _AddToTitleState extends State<AddToTitle> {
  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments;

    return Scaffold(
      backgroundColor: AppColors.color4,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 60.h, left: 10.w),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    size: 34.h,
                    AppIcons.back,
                    color: AppColors.color3,
                  ),
                ),
                SizedBox(
                  width: 330.w,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(AddToDoUpdate());
                  },
                  child: Icon(
                    size: 34.h,
                    AppIcons.update,
                    color: AppColors.color3,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: EdgeInsets.only(right: 200.w),
            child: Text(
              arguments['title'],
              style: TextStyle(
                  color: AppColors.color3,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                  fontFamily: "Poppins"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Divider(
              thickness: 0.1,
              color: AppColors.color3,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 11.w, right: 11.w, top: 20.h),
            child: Text(
              textAlign: TextAlign.center,
              arguments['description'],
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                  color: AppColors.color3,
                  fontFamily: "Poppins"),
            ),
          ),
        ],
      ),
    );
  }
}
