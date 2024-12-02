import 'package:bookshelf_app/system/app_colors.dart';
import 'package:bookshelf_app/system/book_model.dart';
import 'package:flutter/material.dart';

class GetBook extends StatelessWidget {

  final VoidCallback onPressed;

  const GetBook({required this.onPressed,super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Icon(
          Icons.favorite_border_rounded,
          color: Colors.red,
          size: 32,
        ),
        SizedBox(height: 50,),
        MaterialButton(
          height: 35,
          minWidth: 100,
          elevation: 0,
          color: AppColors.primaryColor,
          onPressed: onPressed,
          child: Text(
            "Взять почитать",
            style: TextStyle(
              color: AppColors.backgroundColor,
            ),
          ),
        ),
      ],
    );
  }
}
