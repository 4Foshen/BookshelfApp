import 'package:bookshelf_app/system/app_colors.dart';
import 'package:bookshelf_app/system/book_model.dart';
import 'package:bookshelf_app/widgets/booklist_element.dart';
import 'package:bookshelf_app/widgets/booklist_states/delete_book.dart';
import 'package:bookshelf_app/widgets/booklist_states/order_book.dart';
import 'package:bookshelf_app/widgets/search_widget.dart';
import 'package:flutter/material.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({super.key});

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  List<Book> books = [];

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
        title: SearchWidget(
          hintText: "Поиск по книгам",
          iconButton: Container(),
          width: 300,
          spacing: 0,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Мои заказы",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 550,
            child: ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                return BookListElement(
                    bookInfo: books[index],
                    rightWidget: OrderBook(bookInfo: books[index]));
              },
            ),
          )
        ],
      ),
    );
  }
}
