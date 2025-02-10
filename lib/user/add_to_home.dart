import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/constant/app_colors.dart';
import 'package:to_do_app/constant/app_images.dart';

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
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage(AppImages.image4),
                  ),
                ),
                height: 300.h,
                width: double.infinity,
              ),
              Positioned(
                bottom: 120.h,
                child: CircleAvatar(
                  radius: 60.r,
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
          ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, index) {
                return GestureDetector(
                  onTap: () {},
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
                        padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                        child: ListTile(
                            title: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 160.h),
                                  child: Text(
                                    data[index]['title'],
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 70.h),
                                  child: Text(
                                    data[index]['des'],
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                            trailing: Text(
                              style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w700),
                              data[index]['time'],
                            )),
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
