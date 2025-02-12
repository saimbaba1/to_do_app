import 'package:flutter/material.dart';
import 'package:to_do_app/constant/app_colors.dart';

class CommonTextfield extends StatefulWidget {
  final String? Function(String?)? validator;
  final String hintText;
  final TextEditingController controller;

  const CommonTextfield({
    super.key,
    required this.hintText,
    required this.controller,
    this.validator,
  });

  @override
  State<CommonTextfield> createState() => _CommonTextfieldState();
}

class _CommonTextfieldState extends State<CommonTextfield> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 17),
      child: TextFormField(
        validator: widget.validator,
        controller: widget.controller,
        enabled: true,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontFamily: "font",
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: AppColors.color3,
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.color2, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.color2, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.color2, width: 2),
          ),
          contentPadding: EdgeInsets.all(15),
        ),
      ),
    );
  }
}
