// ignore_for_file: prefer_const_constructors

import 'package:bookshelf_app/system/app_colors.dart';
import 'package:bookshelf_app/system/book_model.dart';
import 'package:bookshelf_app/system/book_service.dart';
import 'package:bookshelf_app/system/user_service.dart';
import 'package:flutter/material.dart';

class BookPage extends StatefulWidget {
  final Book bookInfo;

  const BookPage({required this.bookInfo, super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  void _toogle(Book bookInfo) async {
    final token = await ApiService().getToken();
    final BookService service = BookService(token: token!);

    setState(() {
      bookInfo.hasFavorite = !bookInfo.hasFavorite;
    });

    await service.toggleFavorites(bookInfo.bookId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.chevron_left_rounded,
              size: 40,
              color: AppColors.primaryColor,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 270,
              width: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                image: DecorationImage(
                  image: AssetImage("assets/img/book.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //RATE AND FAVORITE
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star_rounded,
                  color: Colors.yellow[600],
                  size: 32,
                ),
                Text(
                  widget.bookInfo.rating.toString(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 250,
                ),
                // IconButton(
                //     onPressed: () {
                //       _toogle(widget. bookInfo);
                //     },
                //     icon: Icon(
                //       widget.bookInfo.hasFavorite
                //           ? Icons.favorite
                //           : Icons.favorite_border,
                //       size: 32,
                //       color: Colors.red,
                //     )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            //NAME AND BUTTON
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 200,
                      child: Text(
                        widget.bookInfo.content.ru.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Text(
                      widget.bookInfo.author,
                      style: TextStyle(
                          fontSize: 14, color: AppColors.secondaryTextColor),
                    )
                  ],
                ),
                MaterialButton(
                  onPressed: () {
                    Library.addToCart(widget.bookInfo);
                  },
                  minWidth: 120,
                  height: 35,
                  color: AppColors.primaryColor,
                  child: Text(
                    "Взять почитать",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),

            SizedBox(
              height: 20,
            ),
            //DESCRIPTION
            Container(
              width: 350,
              child: Text(
                widget.bookInfo.content.ru.description,
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ),
      ),
    );
  }
}
