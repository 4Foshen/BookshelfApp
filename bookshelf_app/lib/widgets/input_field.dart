import 'package:bookshelf_app/system/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final List<TextInputFormatter> inputFormatters;
  final String hintText;
  final bool obscure;

  InputField({
    required this.controller,
    required this.inputFormatters,
    required this.hintText,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.secondaryColor,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        controller: controller,
        inputFormatters: inputFormatters,
        obscureText: obscure,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }
}

class MultilineInputField extends StatelessWidget {
  final TextEditingController controller;
  final List<TextInputFormatter> inputFormatters;
  final String hintText;

  MultilineInputField({
    required this.controller,
    required this.inputFormatters,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.secondaryColor,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        controller: controller,
        inputFormatters: inputFormatters,
        maxLines: 6,
        minLines: 3,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }
}
