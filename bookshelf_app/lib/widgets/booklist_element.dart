import 'package:bookshelf_app/pages/book_page.dart';
import 'package:bookshelf_app/system/app_colors.dart';
import 'package:flutter/material.dart';

class BookListElement extends StatelessWidget {
  final String bookName;
  final String authorName;
  final String rate;
  final Widget rightWidget;

  const BookListElement(
      {required this.rate,
      required this.bookName,
      required this.authorName,
      required this.rightWidget,
      super.key});

  @override
  Widget build(BuildContext context) {
    String finalName =
        bookName.length > 20 ? bookName.substring(0, 19) + ".." : bookName;

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
                      builder: (context) => BookPage(),
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
              //TEXT COLLUMN
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                        authorName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
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
                      Text(
                        rate,
                        style: TextStyle(fontSize: 16),
                      )
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
