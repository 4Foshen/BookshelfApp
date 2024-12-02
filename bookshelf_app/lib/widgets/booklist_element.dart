// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'package:bookshelf_app/pages/books/book_page.dart';
import 'package:bookshelf_app/system/app_colors.dart';
import 'package:bookshelf_app/system/book_model.dart';
import 'package:flutter/material.dart';

class BookListElement extends StatelessWidget {
  final Book bookInfo;
  final Widget rightWidget;

  const BookListElement(
      {required this.bookInfo,
      required this.rightWidget,
      super.key});

  @override
  Widget build(BuildContext context) {
    String finalName =
        bookInfo.content.ru.title.length > 20 ? bookInfo.content.ru.title.substring(0, 19) + ".." : bookInfo.content.ru.title;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //IMAGE BOOK
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookPage(bookInfo: bookInfo,),
                    ),
                  );
                },
                child: Container(
                  height: 130,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    image: DecorationImage(
                      image: AssetImage("assets/img/book.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              //TEXT COLUMN
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: 95,
                      child: Text(
                        bookInfo.genre.ru,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      )),
                  Container(
                      width: 95,
                      child: Text(
                        finalName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      )),
                  Container(
                      width: 95,
                      child: Text(
                        bookInfo.author,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: AppColors.secondaryTextColor,
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star_rounded,
                        color: Colors.yellow[600],
                      ),
                      // Text(
                      //   bookInfo.rating.toString(),
                      //   style: TextStyle(fontSize: 16),
                      // )
                    ],
                  )
                ],
              ),
              rightWidget
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
            child: Container(
                width: 320,
                child: Divider(
                  color: Colors.grey.shade300,
                ))),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
