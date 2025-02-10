import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/constant/app_colors.dart';
import 'package:to_do_app/constant/app_images.dart';
import 'package:to_do_app/view/auth/signup_screen.dart';
import 'package:to_do_app/widgets/button/common_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color4,
      body: Padding(
        padding: EdgeInsets.only(top: 202.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset(AppImages.image1)),
            SizedBox(
              height: 18.h,
            ),
            Text(
              "Get things done with TODo",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                  fontFamily: "Poppins"),
            ),
            SizedBox(
              height: 18.h,
            ),
            Text(
              textAlign: TextAlign.center,
              "Lorem ipsum dolor sit amet,\nconsectetur adipisicing. Maxime,\ntempore! Animi nemo aut atque,\ndeleniti nihil dolorem repellendus.",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                  fontFamily: "Poppins"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 56.h),
              child: CommonButton(
                title: 'Get Started',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignupScreen()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
