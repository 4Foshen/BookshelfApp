// ignore_for_file: prefer_const_constructors

import 'package:bookshelf_app/pages/books/catalog_page.dart';
import 'package:bookshelf_app/system/app_colors.dart';
import 'package:flutter/material.dart';

class FavoriteBook extends StatelessWidget {
  const FavoriteBook({super.key});

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
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CatalogPage()));
          },
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