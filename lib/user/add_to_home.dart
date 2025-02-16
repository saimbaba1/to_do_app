import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constant/app_colors.dart';
import 'package:to_do_app/constant/app_icons.dart';
import 'package:to_do_app/constant/app_images.dart';
import 'package:to_do_app/user/add_to_do.dart';
import 'package:to_do_app/user/add_to_title.dart';
import 'package:to_do_app/utils/date&time_screen.dart';

class AddToHome extends StatefulWidget {
  const AddToHome({super.key});

  @override
  State<AddToHome> createState() => _AddToHomeState();
}

class _AddToHomeState extends State<AddToHome> {
  final Random _random = Random();

  Color _getRandomColor() {
    List<Color> colors = [
      //your colors
      AppColors.color5,
      AppColors.color6,
      AppColors.color7
    ];
    return colors[_random.nextInt(colors.length)];
  }

  final List<Map<String, dynamic>> data = [
    {"title": "Saim", "des": 'description is this', "time": "3:40 pm"},
    {"title": "Saim", "des": 'description is this', "time": "3:40 pm"},
    {"title": "Saim", "des": 'description is this', "time": "3:40 pm"},
  ];

  final List<Color> colors = [
    AppColors.color5,
    AppColors.color6,
    AppColors.color7
  ];
  final List<String> items = List.generate(20, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color4,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
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
                Positioned(
                  bottom: 120.h,
                  child: CircleAvatar(
                    radius: 60.r,
                    backgroundColor: Color(0xff70968f),
                    backgroundImage: AssetImage(AppImages.image5),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 130.h),
                  child: Text(
                    "Welcome Fisayomi",
                    style: TextStyle(
                      color: AppColors.color3,
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
              ],
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
            FutureBuilder(
              future: FirebaseFirestore.instance.collection('todo').get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Text('Error${(snapshot.error)}');
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddToTitle()));
                          },
                          child: Padding(
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
                                padding:
                                    EdgeInsets.only(top: 10.h, bottom: 10.h),
                                child: ListTile(
                                    title: Text(
                                      snapshot.data!.docs[index]['title'],
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w700),
                                    ),
                                    subtitle: Text(
                                      snapshot.data!.docs[index]['description'],
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w700),
                                    ),
                                    trailing: Text(
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w700),
                                        DateTimeUtil.formatTime(
                                          snapshot.data!.docs[index]['time'],
                                        ))),
                              ),
                            ),
                          ),
                        );
                      });
                }
              },
            ),
          ],
        ),
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
