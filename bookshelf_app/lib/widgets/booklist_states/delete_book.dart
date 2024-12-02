// ignore_for_file: prefer_const_constructors

import 'package:bookshelf_app/pages/books/my_orders_page.dart';
import 'package:bookshelf_app/system/app_colors.dart';
import 'package:bookshelf_app/system/book_model.dart';
import 'package:flutter/material.dart';

class DeleteBook extends StatefulWidget {

  final VoidCallback onPressed;
  

  const DeleteBook({super.key, required this.onPressed});

  @override
  State<DeleteBook> createState() => _DeleteBookState();
}

class _DeleteBookState extends State<DeleteBook> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IconButton(
            onPressed: () {
              
            },
            icon: Icon(
              Icons.favorite_border,
              color: Colors.red,
              size: 32,
            )),
        SizedBox(
          height: 30,
        ),
        IconButton(
            onPressed: widget.onPressed,
            icon: Icon(
              Icons.delete_outlined,
              color: AppColors.secondaryColor,
              size: 32,
            )),
        Container(
          width: 150,
        ),
      ],
    );
  }
}
