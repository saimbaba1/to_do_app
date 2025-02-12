import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constant/app_colors.dart';
import 'package:to_do_app/constant/app_icons.dart';
import 'package:to_do_app/constant/app_images.dart';
import 'package:to_do_app/view/auth/signin_screen.dart';
import 'package:to_do_app/view/auth/signup_screen.dart';
import 'package:to_do_app/widgets/button/common_button.dart';
import 'package:to_do_app/widgets/fields/common_textfield.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController ForgetController = TextEditingController();
  bool isLoadingg = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color4,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 60.h,
                  right: 324.w,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SigninScreen()));
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
                "Forgot Password",
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
              CommonTextfield(
                hintText: "Fotget Password",
                controller: ForgetController,
                validator: (value) {
                  if (value == '' || value == null) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 40.h,
              ),
              CommonButton(
                title: "Forgot",
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      isLoadingg = true;
                    });
                    await FirebaseAuth.instance
                        .sendPasswordResetEmail(email: ForgetController.text);
                    Get.to(() => SignupScreen());
                    setState(() {
                      isLoadingg = false;
                    });
                  }
                },
              ),
              SizedBox(
                height: 40.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
