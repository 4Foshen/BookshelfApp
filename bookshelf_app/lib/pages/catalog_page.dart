import 'package:bookshelf_app/system/app_colors.dart';
import 'package:bookshelf_app/system/book.dart';
import 'package:bookshelf_app/widgets/booklist_element.dart';
import 'package:bookshelf_app/widgets/booklist_states/get_book.dart';
import 'package:bookshelf_app/widgets/booklist_states/have_book.dart';
import 'package:bookshelf_app/widgets/search_widget.dart';
import 'package:flutter/material.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  List<Book> books = [
    Book(
        bookName: "451 Градус по фаренгейту",
        author: "Рэй Брэдбери",
        description:
            "«451 градус по Фаренгейту» — научно-фантастический роман-антиутопия Рэя Брэдбери, изданный в 1953 году. Роман описывает американское общество близкого будущего, в котором книги находятся под запретом. «Пожарные», к числу которых принадлежит и главный герой Гай Монтэг, сжигают любые найденные книги.\nВ ходе романа Монтэг разочаровывается в идеалах общества, частью которого он является, становится изгоем и присоединяется к небольшой подпольной группе маргиналов, сторонники которой заучивают тексты книг, чтобы спасти их для потомков.",
        genre: "Роман",
        term: "29.10.2024",
        imagePath: "assets/img/book.png",
        rating: 4.6,
        isAvailable: true,
        isAwaiting: false),
    Book(
        bookName: "Дюна",
        author: "Фрэнк Гербертс",
        description: "Описание",
        genre: "Роман",
        term: "01.11.2024",
        imagePath: "assets/img/book.png",
        rating: 4.6,
        isAvailable: true,
        isAwaiting: false),
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
          iconButton: IconButton(
              onPressed: () {},
              icon: Stack(
                clipBehavior: Clip.none,
                children: [
                  Icon(
                    Icons.shopping_cart,
                    color: AppColors.secondaryColor,
                    size: 30,
                  ),
                  Positioned(
                    right: -10,
                    top: -10,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: AppColors.secondaryColor, width: 2),
                      ),
                      child: Text(
                        //INPUT HERE ITEM COUNT
                        "0",
                        style: TextStyle(
                          color: AppColors.secondaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
          width: 250,
          spacing: 0,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Каталог",
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
                    rightWidget: GetBook(onButtonPress: (){
                      //ADD TO CART
                    }));
              },
            ),
          )
        ],
      ),
    );
  }
}
