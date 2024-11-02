import 'package:bookshelf_app/pages/catalog_page.dart';
import 'package:bookshelf_app/system/app_colors.dart';
import 'package:bookshelf_app/system/book.dart';
import 'package:bookshelf_app/widgets/booklist_element.dart';
import 'package:bookshelf_app/widgets/booklist_states/delete_book.dart';
import 'package:bookshelf_app/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

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
        isAwaiting: false,
        isReady: true),
    Book(
        bookName: "Дюна",
        author: "Фрэнк Гербертс",
        description: "Описание",
        genre: "Роман",
        term: "01.11.2024",
        imagePath: "assets/img/book.png",
        rating: 4.6,
        isAvailable: true,
        isAwaiting: false,
        isReady: true),
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
          SizedBox(height: 10,),
          
          //TEXT
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Корзина",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          
          
          //BOOKLIST
          Container(
              height: 500,
              child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  return BookListElement(
                      bookInfo: books[index],
                      rightWidget: DeleteBook());
                },
              ),
            ),
        
          //BUTTONS
          Center(
            child: Container(
                      width: 280,
                      height: 51,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF4850E6), Color(0xFF227FF7)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          borderRadius: BorderRadius.circular(5),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 24.0),
                            child: Center(
                              child: Text(
                                'Выбрать еще',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
          ),
          SizedBox(height: 15,),
          Center(
            child: Container(
                      width: 280,
                      height: 51,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFFED400), Color(0xFFFED400)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            //ADD FUNCT TO ADD TO ZAKAZES
                          },
                          borderRadius: BorderRadius.circular(5),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 24.0),
                            child: Center(
                              child: Text(
                                'Взять на прокат',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
          )
        ],
      ),
    );
  }
}