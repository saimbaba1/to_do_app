import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constant/app_colors.dart';
import 'package:to_do_app/constant/app_icons.dart';
import 'package:to_do_app/models/todo_model.dart';
import 'package:to_do_app/view/user/update_screen.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final TodoModel arguments = Get.arguments;

    return Scaffold(
      backgroundColor: AppColors.color4,
      body: SingleChildScrollView(
        child: Column(
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
                      TodoModel todoModel = TodoModel(
                          docid: arguments.docid,
                          title: arguments.title,
                          description: arguments.description,
                          createdAt: arguments.createdAt);
                      Get.to(UpdateScreen(), arguments: todoModel);
                    },
                    child: Icon(
                      size: 25.h,
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
              padding: EdgeInsets.only(right: 295.w),
              child: Text(
                arguments.title,
                style: TextStyle(
                    color: AppColors.color3,
                    fontWeight: FontWeight.w600,
                    fontSize: 20.sp,
                    fontFamily: "Poppins"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
              child: Divider(
                thickness: 1,
                color: AppColors.color1,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 13.w, right: 13.w, top: 10.h),
              child: Text(
                arguments.description,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                    color: AppColors.color3,
                    fontFamily: "Poppins"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
