import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constant/app_colors.dart';
import 'package:to_do_app/constant/app_icons.dart';
import 'package:to_do_app/constant/app_images.dart';
import 'package:to_do_app/view/auth/signin_screen.dart';
import 'package:to_do_app/widgets/fields/common_textfield.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final String userid = FirebaseAuth.instance.currentUser!.uid;
  final TextEditingController emailController = TextEditingController();
  @override
  void initState() {
    super.initState();
    final arguments = Get.arguments ?? {};
    nameController.text = arguments['name'] ?? '';
    emailController.text = arguments['email'] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments;
    return Scaffold(
      backgroundColor: AppColors.color4,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(alignment: Alignment.center, children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      AppImages.image4,
                    ),
                  ),
                ),
                height: 300.h,
                width: double.infinity,
              ),
              Padding(
                padding: EdgeInsets.only(left: 150.w, bottom: 30.h),
                child: Row(
                  children: [
                    CircleAvatar(
                        radius: 60.r,
                        backgroundColor: Color(0xff70968f),
                        backgroundImage: NetworkImage(arguments['image'])),
                    Padding(
                      padding: EdgeInsets.only(bottom: 150.h, left: 80.w),
                      child: GestureDetector(
                        onTap: () {
                          final argument = Get.arguments;
                          final String userid = argument['userId'];
                          save(userid);
                        },
                        child: Text(
                          "Save",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17.sp,
                              color: AppColors.color2,
                              fontFamily: "Poppins"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ]),
            Padding(
              padding: EdgeInsets.only(right: 290.w, bottom: 10.h),
              child: Text(
                "Edit Profile",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17.sp,
                    color: AppColors.color1,
                    fontFamily: "Poppins"),
              ),
            ),
            CommonTextfield(
              hintText: "",
              suffixIcon: Icon(AppIcons.update),
              controller: nameController,
              validator: (value) {
                if (value == '' || value == null) {
                  return 'Please enter your Description';
                }
                return null;
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            CommonTextfield(
              hintText: "",
              controller: emailController,
              readOnly: true,
              validator: (value) {
                if (value == '' || value == null) {
                  return 'Please enter your Description';
                }
                return null;
              },
            ),
            Padding(
              padding: EdgeInsets.only(right: 320.w, bottom: 40.h, top: 20.h),
              child: Text(
                "More",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17.sp,
                    color: AppColors.color1,
                    fontFamily: "Poppins"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w),
              child: Row(
                children: [
                  Icon(AppIcons.privacy),
                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Text(
                      "Privacy Policy",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17.sp,
                          color: AppColors.color3,
                          fontFamily: "Poppins"),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, top: 15.h, bottom: 15.h),
              child: Row(
                children: [
                  Icon(AppIcons.terms),
                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Text(
                      "Terms & Conditions",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17.sp,
                          color: AppColors.color3,
                          fontFamily: "Poppins"),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w),
              child: GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Get.to(SigninScreen());
                },
                child: Row(
                  children: [
                    Icon(
                      AppIcons.logout,
                      color: AppColors.color8,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.w),
                      child: Text(
                        "Logout",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17.sp,
                            color: AppColors.color8,
                            fontFamily: "Poppins"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future save(String userid) async {
    try {
      await FirebaseFirestore.instance
          .collection('userprofile')
          .doc(userid)
          .update({
        'name': nameController.text,
      });

      Get.back();
    } catch (e) {
      Get.snackbar('error', e.toString());
    }
  }
}
