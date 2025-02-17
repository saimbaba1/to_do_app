import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constant/app_colors.dart';
import 'package:to_do_app/constant/app_icons.dart';

class AddToDoUpdate extends StatefulWidget {
  const AddToDoUpdate({super.key});

  @override
  State<AddToDoUpdate> createState() => _AddToDoUpdateState();
}

class _AddToDoUpdateState extends State<AddToDoUpdate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color4,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 60.h,
              right: 350.w,
            ),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(
                size: 34.h,
                AppIcons.back,
                color: AppColors.color3,
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.zero,
              isDense: true,
            ),
            style: TextStyle(color: Colors.transparent),
            cursorColor: Colors.transparent,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Divider(
              thickness: 0.2,
              color: AppColors.color3,
            ),
          ),
          TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.zero,
              isDense: true,
            ),
            style: TextStyle(color: Colors.transparent),
            cursorColor: Colors.transparent,
          )
        ],
      ),
    );
  }
}
