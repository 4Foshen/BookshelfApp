import 'package:bookshelf_app/system/app_colors.dart';
import 'package:flutter/material.dart';

class HaveBook extends StatelessWidget {
  final String date;

  const HaveBook({required this.date, super.key});

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
        MaterialButton(
          height: 35,
          minWidth: 100,
          elevation: 0,
          color: AppColors.primaryColor,
          onPressed: () {
            //ADD FUNCTION
          },
          child: Text(
            "Продлить книгу",
            style: TextStyle(
              color: AppColors.backgroundColor,
            ),
          ),
        ),
        Text.rich(
          TextSpan(children: [
            TextSpan(
                text: "Сдать до: ",
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(
                text: date, style: TextStyle(fontWeight: FontWeight.normal))
          ]),
        )
      ],
    );
  }
}
