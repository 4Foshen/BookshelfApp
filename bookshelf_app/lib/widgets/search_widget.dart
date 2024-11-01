import 'package:bookshelf_app/system/app_colors.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final String hintText;
  final IconButton iconButton;
  final double width;
  final double height;
  final double spacing;

  const SearchWidget(
      {required this.hintText,
      required this.iconButton,
      this.width = 320,
      this.height = 50,
      this.spacing = 20,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: spacing,
        ),
        SizedBox(
          width: width,
          height: height,
          child: TextField(
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: AppColors.secondaryTextColor),
              prefixIcon: Icon(
                Icons.search,
                color: AppColors.primaryColor,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: AppColors.primaryColor,
                  width: 2.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: AppColors.primaryColor,
                  width: 2.0,
                ),
              ),
            ),
          ),
        ),
        iconButton,
      ],
    );
  }
}
