import 'package:flutter/material.dart';

class UpdateTextfield extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextStyle? textStyle;
  const UpdateTextfield({
    super.key,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      style: textStyle,
      maxLines: null,
      decoration: InputDecoration(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        contentPadding: EdgeInsets.zero,
        isDense: true,
      ),
    );
  }
}
