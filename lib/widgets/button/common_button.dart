import 'package:flutter/material.dart';
import 'package:to_do_app/constant/app_colors.dart';

class CommonButton extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  const CommonButton({super.key, required this.title, required this.onTap});

  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
          height: 50,
          width: 220,
          color: AppColors.color1,
          child: Center(
            child: Text(
              widget.title,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: AppColors.color2,
                  fontFamily: "Poppins"),
            ),
          )),
    );
  }
}
