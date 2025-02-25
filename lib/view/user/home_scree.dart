import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constant/app_colors.dart';
import 'package:to_do_app/constant/app_icons.dart';
import 'package:to_do_app/constant/app_images.dart';
import 'package:to_do_app/controller/todo_controller.dart';
import 'package:to_do_app/controller/user_info_controller.dart';
import 'package:to_do_app/utils/loading_util.dart';
import 'package:to_do_app/view/user/add_to_do.dart';
import 'package:to_do_app/view/user/detail_screen.dart';
import 'package:to_do_app/utils/date&time_screen.dart';
import 'package:to_do_app/view/user/profile_screen.dart';

class AddToHome extends StatefulWidget {
  const AddToHome({super.key});

  @override
  State<AddToHome> createState() => _AddToHomeState();
}

class _AddToHomeState extends State<AddToHome> {
  final Random _random = Random();
  final arguments = Get.arguments;
  TodoController todoController = Get.put(TodoController());
  UserInfoController userInfoController = Get.put(UserInfoController());

  Color _getRandomColor() {
    List<Color> colors = [AppColors.color5, AppColors.color6, AppColors.color7];
    return colors[_random.nextInt(colors.length)];
  }

  final String userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userInfoController.userprofile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color4,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: AppColors.color1),
            height: 300.h,
            width: double.infinity,
            child: Obx(
              () {
                if (userInfoController.isLoading.value == true) {
                  return LoadingUtil.shimmerTile(itemcount: 6);
                } else if (userInfoController.userInfoList.isEmpty) {
                  return Text('No profile');
                } else {
                  final data = userInfoController.userInfoList;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(() => ProfileScreen(), arguments: {
                            'name': data.first.name,
                            'image': data.first.image,
                            'userId': data.first.userId,
                            'email': data.first.email,
                          });
                        },
                        child: CircleAvatar(
                          radius: 60.r,
                          backgroundColor: Color(0xff70968f),
                          backgroundImage: data.first.image == ''
                              ? AssetImage("assets/dummy.png")
                              : NetworkImage(data.first.image),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: Text(
                          "Welcome ${data.first.name}",
                          style: TextStyle(
                            color: AppColors.color4,
                            fontWeight: FontWeight.w600,
                            fontSize: 20.sp,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 230.w, top: 10.h),
            child: Text(
              "Todo Tasks.",
              style: TextStyle(
                color: AppColors.color3,
                fontWeight: FontWeight.w600,
                fontSize: 20.sp,
                fontFamily: "Poppins",
              ),
            ),
          ),
          Obx(
            () {
              if (todoController.isLoading.value == true) {
                return LoadingUtil.shimmerTile(itemcount: 6);
              } else if (todoController.todoList.isEmpty) {
                return Text('No todo available');
              } else {
                final data = todoController.todoList;
                return Expanded(
                  child: ListView.builder(
                      itemCount: data.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            left: 10.w,
                            right: 10.w,
                          ),
                          child: Card(
                            color: _getRandomColor(),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                              child: ListTile(
                                  onTap: () {
                                    Get.to(DetailScreen(), arguments: {
                                      'title': data[index].title,
                                      'description': data[index].description,
                                      'docid': data[index].docid,
                                    });
                                  },
                                  leading: GestureDetector(
                                    onTap: () async {
                                      String docId = data[index].docid;
                                      await todoController.delete(docId);
                                      await todoController.fetchTodos();
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: AppColors.color8,
                                      child: Icon(
                                        AppIcons.delete,
                                        color: AppColors.color4,
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    data[index].title,
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    data[index].description,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w700),
                                  ),
                                  trailing: Text(
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w700),
                                      DateTimeUtil.formatTime(
                                          data[index].createdAt))),
                            ),
                          ),
                        );
                      }),
                );
              }
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: AppColors.color1,
          child: Center(
            child: Icon(
              AppIcons.add,
              color: AppColors.color2,
            ),
          ),
          onPressed: () {
            Get.to(AddToDo());
          }),
    );
  }
}
