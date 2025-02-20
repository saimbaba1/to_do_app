import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constant/app_colors.dart';
import 'package:to_do_app/constant/app_icons.dart';
import 'package:to_do_app/constant/app_images.dart';
import 'package:to_do_app/view/user/add_to_do.dart';
import 'package:to_do_app/view/auth/forget_password.dart';
import 'package:to_do_app/view/auth/signup_screen.dart';
import 'package:to_do_app/widgets/button/common_button.dart';
import 'package:to_do_app/widgets/fields/common_textfield.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController EmailController = TextEditingController();
  final TextEditingController ComfirmPasswordController =
      TextEditingController();
  bool isLoadingg = false;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: isLoadingg,
      child: Scaffold(
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
                  "Welcome Back!",
                  style: TextStyle(
                      color: AppColors.color3,
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                      fontFamily: "Poppins"),
                ),
                SizedBox(
                  height: 21.h,
                ),
                Image.asset(AppImages.image2),
                SizedBox(
                  height: 15.h,
                ),
                CommonTextfield(
                  hintText: "Enter your Email address",
                  controller: EmailController,
                  validator: (value) {
                    if (value == '' || value == null) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                CommonTextfield(
                  hintText: "Confirm Password",
                  controller: ComfirmPasswordController,
                  validator: (value) {
                    if (value == '' || value == null) {
                      return 'Please confirm your password';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 40.h,
                ),
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Get.to(() => SigninScreen());
                    }
                  },
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => ForgetPassword());
                    },
                    child: Text(
                      textAlign: TextAlign.center,
                      "Forgot Password ?",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                          color: AppColors.color1,
                          fontFamily: "Poppins"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                CommonButton(
                    isLoading: isLoadingg, title: "Sign Up ", onTap: sigin),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      "Dont have an account?",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                          fontFamily: "Poppins"),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => SignupScreen());
                      },
                      child: Text(
                        textAlign: TextAlign.center,
                        " Sign Up",
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
          ),
        ),
      ),
    );
  }

  Future sigin() async {
    try {
      if (_formKey.currentState!.validate()) {
        setState(() {
          isLoadingg = true;
        });
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: EmailController.text,
            password: ComfirmPasswordController.text);
        Get.to(() => AddToDo());
        setState(() {
          isLoadingg = false;
        });
      }
    } catch (e) {
      print(e.toString());
      Get.snackbar("error", e.toString());
      setState(() {
        isLoadingg = false;
      });
    }
  }
}
