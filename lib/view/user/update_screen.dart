import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constant/app_colors.dart';
import 'package:to_do_app/constant/app_icons.dart';
import 'package:to_do_app/widgets/button/common_button.dart';
import 'package:to_do_app/widgets/fields/update_textfield.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  bool isLoadingg = false;
  @override
  void initState() {
    super.initState();
    final arguments = Get.arguments ?? {};
    titleController.text = arguments['title'] ?? '';
    descriptionController.text = arguments['description'] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: isLoadingg,
      child: Scaffold(
        backgroundColor: AppColors.color4,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
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
                  Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: UpdateTextfield(
                        controller: titleController,
                        textStyle: TextStyle(
                            color: AppColors.color3,
                            fontWeight: FontWeight.w600,
                            fontSize: 20.sp,
                            fontFamily: "Poppins"),
                      )),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
                    child: Divider(
                      thickness: 1,
                      color: AppColors.color1,
                    ),
                  ),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
                      child: UpdateTextfield(
                        controller: descriptionController,
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp,
                            color: AppColors.color3,
                            fontFamily: "Poppins"),
                      )),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30.h),
                child: CommonButton(
                  title: "Update",
                  isLoading: isLoadingg,
                  onTap: () {
                    final argument = Get.arguments;
                    final String docid = argument['docid'];
                    update(docid);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future update(String docId) async {
    try {
      setState(() {
        isLoadingg = true;
      });

      await FirebaseFirestore.instance.collection('todo').doc(docId).update({
        'title': titleController.text,
        'description': descriptionController.text,
      });

      Get.back();
      setState(() {
        isLoadingg = false;
      });
    } catch (e) {
      Get.snackbar('error', e.toString());
      setState(() {
        isLoadingg = false;
      });
    }
  }
}
