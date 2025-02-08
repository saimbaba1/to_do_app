import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/constant/app_colors.dart';
import 'package:to_do_app/constant/app_icons.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Icon(
            AppIcons.back,
            color: AppColors.color3,
          ),
          Text(
            "Welcome Onboard!",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                fontFamily: "Poppins"),
          ),
          SizedBox(
            height: 18.h,
          ),
          Text(
            textAlign: TextAlign.center,
            "Let’s help you meet up your task",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                fontFamily: "Poppins"),
          ),
        ],
      ),
    );
  }
}
