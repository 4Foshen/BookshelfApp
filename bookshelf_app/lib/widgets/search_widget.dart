import 'package:bookshelf_app/system/app_colors.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final String hintText;

  const SearchWidget({required this.hintText, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 20,
        ),
        SizedBox(
          width: 320,
          height: 60,
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
        IconButton(
            onPressed: () {
              //on button press
            },
            icon: Icon(Icons.person_outline_rounded, size: 36))
      ],
    );
  }
}
