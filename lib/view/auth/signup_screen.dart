import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constant/app_colors.dart';
import 'package:to_do_app/constant/app_icons.dart';
import 'package:to_do_app/user/add_to_do.dart';
import 'package:to_do_app/view/auth/signin_screen.dart';
import 'package:to_do_app/widgets/button/common_button.dart';
import 'package:to_do_app/widgets/fields/common_textfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController NameController = TextEditingController();
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();
  final TextEditingController ComfirmPasswordController =
      TextEditingController();

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
            height: 18.h,
          ),
          Text(
            textAlign: TextAlign.center,
            "Let’s help you meet up your task",
            style: TextStyle(
                color: AppColors.color1,
                fontWeight: FontWeight.w500,
                fontSize: 13.sp,
                fontFamily: "Poppins"),
          ),
          SizedBox(
            height: 70.h,
          ),
          CommonTextfield(
              hintText: "Enter your Full Name", controller: NameController),
          SizedBox(
            height: 20.h,
          ),
          CommonTextfield(
              hintText: "Enter your Email address",
              controller: EmailController),
          SizedBox(
            height: 20.h,
          ),
          CommonTextfield(
              hintText: "Create a Password", controller: NameController),
          SizedBox(
            height: 20.h,
          ),
          CommonTextfield(
              hintText: "Confirm your Password",
              controller: ComfirmPasswordController),
          SizedBox(
            height: 80.h,
          ),
          CommonButton(
              title: "Sign Up ",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddToDo()));
              }),
          SizedBox(
            height: 40.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textAlign: TextAlign.center,
                "Already have an account?",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                    fontFamily: "Poppins"),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(SigninScreen());
                },
                child: Text(
                  textAlign: TextAlign.center,
                  " Sign in",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                      color: AppColors.color1,
                      fontFamily: "Poppins"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
