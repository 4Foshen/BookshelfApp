import 'package:bookshelf_app/system/app_colors.dart';
import 'package:bookshelf_app/system/library_controller.dart';
import 'package:flutter/material.dart';

class BookPage extends StatefulWidget {
  final Book bookInfo;

  const BookPage({required this.bookInfo, super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
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
                Icon(
                  Icons.favorite_border,
                  color: Colors.red,
                  size: 32,
                ),
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
                        widget.bookInfo.bookName,
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
                    //Add to korzina
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
                widget.bookInfo.description,
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ),
      ),
    );
  }
}
