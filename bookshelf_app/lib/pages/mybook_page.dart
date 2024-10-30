import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookshelf_app/system/app_colors.dart';
import 'package:bookshelf_app/widgets/search_widget.dart';
import 'package:flutter/material.dart';

class MyBookPage extends StatefulWidget {
  const MyBookPage({super.key});

  @override
  State<MyBookPage> createState() => _MyBookPageState();
}

class _MyBookPageState extends State<MyBookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          SearchWidget(hintText: "Поиск по книгам"),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Мои заказы",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          BookListElement(
            bookName: "451 градус по фаренгейту",
            authorName: "Рей Бредбери",
          ),
        ],
      ),
    );
  }
}

class BookListElement extends StatelessWidget {
  final String bookName;
  final String authorName;

  const BookListElement(
      {required this.bookName, required this.authorName, super.key});

  @override
  Widget build(BuildContext context) {
    String finalName =
        bookName.length > 20 ? bookName.substring(0, 20) + ".." : bookName;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //IMAGE BOOK
              Container(
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
                    height: 30,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star_rounded,
                        color: Colors.yellow[600],
                      ),
                      Text(
                        "4.7",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.cancel_outlined),
                      Text("Нет в наличии")
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 10,),
        Center(
            child: Container(
                width: 320,
                child: Divider(
                  color: Colors.grey.shade300,
                ))),
      ],
    );
  }
}
