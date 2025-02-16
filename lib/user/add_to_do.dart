import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constant/app_colors.dart';
import 'package:to_do_app/constant/app_icons.dart';
import 'package:to_do_app/constant/app_images.dart';
import 'package:to_do_app/user/add_to_home.dart';
import 'package:to_do_app/widgets/button/common_button.dart';
import 'package:to_do_app/widgets/fields/common_textfield.dart';

class AddToDo extends StatefulWidget {
  const AddToDo({super.key});

  @override
  State<AddToDo> createState() => _AddToDoState();
}

class _AddToDoState extends State<AddToDo> {
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController TitleController = TextEditingController();
  final TextEditingController DescriptionController = TextEditingController();
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
                "Add New ToDo",
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
              CommonTextfield(
                hintText: "Title",
                controller: TitleController,
                validator: (value) {
                  if (value == '' || value == null) {
                    return 'Please enter your title';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              CommonTextfield(
                hintText: "Description",
                controller: DescriptionController,
                validator: (value) {
                  if (value == '' || value == null) {
                    return 'Please enter your Description';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 40.h,
              ),
              CommonButton(
                  isLoading: isLoading,
                  title: 'Add to list ',
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        setState(() {
                          isLoading = true;
                        });
                        User? user = FirebaseAuth.instance.currentUser;
                        DocumentReference docRef =
                            FirebaseFirestore.instance.collection('todo').doc();
                        await docRef.set({
                          'docid': docRef.id,
                          'title': TitleController.text,
                          'description': DescriptionController.text,
                          'time': DateTime.now().toString(),
                          "userid": user!.uid.toString()
                        });
                        setState(() {
                          isLoading = false;
                        });
                        Get.to(AddToHome());
                      } catch (e) {
                        Get.snackbar('error', e.toString());
                        setState(() {
                          isLoading = false;
                        });
                      }
                    }
                  }),
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
