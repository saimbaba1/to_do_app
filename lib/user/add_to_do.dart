import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/constant/app_colors.dart';
import 'package:to_do_app/constant/app_icons.dart';
import 'package:to_do_app/constant/app_images.dart';
import 'package:to_do_app/user/add_to_home.dart';
import 'package:to_do_app/view/auth/signin_screen.dart';
import 'package:to_do_app/widgets/button/common_button.dart';
import 'package:to_do_app/widgets/fields/common_textfield.dart';

class AddToDo extends StatefulWidget {
  const AddToDo({super.key});

  @override
  State<AddToDo> createState() => _AddToDoState();
}

class _AddToDoState extends State<AddToDo> {
  final TextEditingController TitleController = TextEditingController();
  final TextEditingController DescriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color4,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 60.h,
              right: 324.w,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SigninScreen()));
              },
              child: Icon(
                size: 34.h,
                AppIcons.back,
                color: AppColors.color3,
              ),
            ),
          ),
          SizedBox(
            height: 79.h,
          ),
          Text(
            "Welcome Onboard!",
            style: TextStyle(
                color: AppColors.color3,
                fontWeight: FontWeight.w600,
                fontSize: 20.sp,
                fontFamily: "Poppins"),
          ),
          SizedBox(
            height: 21.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 50.w),
            child: Image.asset(AppImages.image3),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            textAlign: TextAlign.center,
            "Add What your want to do later on..",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15.sp,
                color: AppColors.color1,
                fontFamily: "Poppins"),
          ),
          SizedBox(
            height: 20.h,
          ),
          CommonTextfield(hintText: "Title", controller: TitleController),
          SizedBox(
            height: 20.h,
          ),
          CommonTextfield(
              hintText: "Description", controller: DescriptionController),
          SizedBox(
            height: 40.h,
          ),
          CommonButton(
              title: "Add to list",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddToHome()));
              }),
          SizedBox(
            height: 40.h,
          ),
        ],
      ),
    );
  }
}
