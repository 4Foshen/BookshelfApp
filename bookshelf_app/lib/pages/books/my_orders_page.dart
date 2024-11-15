import 'package:bookshelf_app/system/app_colors.dart';
import 'package:bookshelf_app/system/library_controller.dart';
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
  List<Book> books = [
    Book(
        id: 0,
        bookName: "451 Градус по фаренгейту",
        author: "Рэй Брэдбери",
        description:
            "«451 градус по Фаренгейту» — научно-фантастический роман-антиутопия Рэя Брэдбери, изданный в 1953 году. Роман описывает американское общество близкого будущего, в котором книги находятся под запретом. «Пожарные», к числу которых принадлежит и главный герой Гай Монтэг, сжигают любые найденные книги.\nВ ходе романа Монтэг разочаровывается в идеалах общества, частью которого он является, становится изгоем и присоединяется к небольшой подпольной группе маргиналов, сторонники которой заучивают тексты книг, чтобы спасти их для потомков.",
        genre: "Роман",
        term: "29.10.2024",
        imagePath: "assets/img/book.png",
        rating: 4.6,
        isAvailable: true,
        isAwaiting: false,
        isReady: true),
    Book(
      id: 0,
      bookName: "Дюна",
      author: "Фрэнк Гербертс",
      description: "Описание",
      genre: "Роман",
      term: "01.11.2024",
      imagePath: "assets/img/book.png",
      rating: 4.6,
      isAvailable: false,
      isAwaiting: false,
      isReady: false,
    ),
    Book(
      id: 0,
      bookName: "Дюна",
      author: "Фрэнк Гербертс",
      description: "Описание",
      genre: "Роман",
      term: "01.11.2024",
      imagePath: "assets/img/book.png",
      rating: 4.6,
      isAvailable: true,
      isAwaiting: true,
      isReady: false,
    ),
  ];

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
