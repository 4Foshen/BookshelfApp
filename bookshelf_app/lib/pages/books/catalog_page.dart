// ignore_for_file: prefer_const_constructors

import 'package:bookshelf_app/pages/books/cart_page.dart';
import 'package:bookshelf_app/system/app_colors.dart';
import 'package:bookshelf_app/system/book_model.dart';
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

  int itemsAmount = 0;

  @override
  void initState() {
    itemsAmount = Library.cart.length;
    super.initState();
  }

  void _navigateAndUpdate() async {
    final updatedData = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartPage(),
      ),
    );

    setState(() {
      itemsAmount = Library.cart.length;
    });
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
        title: SearchWidget(
          hintText: "Поиск по книгам",
          iconButton: IconButton(
              onPressed: () {
                _navigateAndUpdate();
              },
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
                        Library.cart.length.toString(),
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
              itemCount: Library.books.length,
              itemBuilder: (context, index) {
                return BookListElement(
                    bookInfo: Library.books[index],
                    rightWidget: GetBook(onPressed: () {
                      setState(() {
                        Library.addToCart(Library.books[index]);
                      });
                    },));
              },
            ),
          )
        ],
      ),
    );
  }
}
