// ignore_for_file: prefer_const_constructors

import 'package:bookshelf_app/system/app_colors.dart';
import 'package:bookshelf_app/system/book_model.dart';
import 'package:bookshelf_app/system/book_service.dart';
import 'package:bookshelf_app/system/user_service.dart';
import 'package:flutter/material.dart';

class GetBook extends StatefulWidget {
  final Book bookInfo;
  final VoidCallback onFavorite;
  final VoidCallback onPressed;

  const GetBook(
      {required this.onPressed,
      required this.bookInfo,
      required this.onFavorite,
      super.key});

  @override
  State<GetBook> createState() => _GetBookState();
}

class _GetBookState extends State<GetBook> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IconButton(
            onPressed: widget.onFavorite,
            icon: Icon(
              widget.bookInfo.hasFavorite
                  ? Icons.favorite
                  : Icons.favorite_border,
              size: 32,
              color: Colors.red,
            )),
        SizedBox(
          height: 50,
        ),
        MaterialButton(
          height: 35,
          minWidth: 100,
          elevation: 0,
          color: AppColors.primaryColor,
          onPressed: widget.onPressed,
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
