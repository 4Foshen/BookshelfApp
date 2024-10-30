import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookshelf_app/system/app_colors.dart';
import 'package:bookshelf_app/widgets/booklist_element.dart';
import 'package:bookshelf_app/widgets/booklist_states/have_book.dart';
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
              "Мои книги",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),

          //Add list builder
          BookListElement(
            bookName: "451 градус по фаренгейту",
            authorName: "Рей Бредбери",
            rate: "4.6",
            rightWidget: HaveBook(date: "29.10.2024",),
          ),
          BookListElement(
            bookName: "Жай пример",
            authorName: "Хто я",
            rate: "2.8",
            rightWidget: HaveBook(date: "29.10.2024",),
          ),
        ],
      ),
    );
  }
}


