// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookshelf_app/pages/books/catalog_page.dart';
import 'package:bookshelf_app/pages/books/my_orders_page.dart';
import 'package:bookshelf_app/pages/profile/profile_page.dart';
import 'package:bookshelf_app/system/app_colors.dart';
import 'package:bookshelf_app/system/book_model.dart';
import 'package:bookshelf_app/widgets/booklist_element.dart';
import 'package:bookshelf_app/widgets/booklist_states/have_book.dart';
import 'package:bookshelf_app/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            height: 40,
          ),
          SearchWidget(
            hintText: "Поиск по книгам",
            iconButton: IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                },
                icon: Icon(Icons.person_outline_rounded, size: 36)),
          ),
          
          //MY BOOKS TEXT
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "Мои книги",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 80,),
                OutlinedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MyOrdersPage()));
                      },
                      style: OutlinedButton.styleFrom(
                        side:
                            BorderSide(color: AppColors.secondaryColor, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset("assets/svg/events.svg"),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Мои заказы",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.textColor,
                            ),
                          ),
                        ],
                      )),
              ],
            ),
          ),

          //SCREEN IF NO BOOKS
          if (Library.ownedBooks.isEmpty)
            Center(
              child: Column(
                children: [
                  SvgPicture.asset("assets/svg/book_lover.svg"),
                  Text(
                    "Здесь пока пусто!",
                    style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Выберите книги, которые хотите взять на прокат в нашем каталоге!",
                    style: TextStyle(
                        color: Color(0xFFC83EAA),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CatalogPage()));
                        },
                        borderRadius: BorderRadius.circular(5),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 24.0),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/svg/books.svg",
                                  color: Colors.white,
                                ),
                                Text(
                                  'Перейти в каталог',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

          //BOOK LIST
          // if (Library.ownedBooks.isNotEmpty)
          //   Container(
          //     height: 550,
          //     child: ListView.builder(
          //       itemCount: Library.ownedBooks.length,
          //       itemBuilder: (context, index) {
          //         return BookListElement(
          //             bookInfo: Library.ownedBooks[index],
          //             rightWidget: HaveBook(date: Library.ownedBooks[index].term));
          //       },
          //     ),
          //   )
        ],
      ),
    );
  }
}
