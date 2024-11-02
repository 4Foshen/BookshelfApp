import 'package:bookshelf_app/pages/my_orders_page.dart';
import 'package:bookshelf_app/system/app_colors.dart';
import 'package:flutter/material.dart';

class DeleteBook extends StatefulWidget {
  const DeleteBook({super.key});

  @override
  State<DeleteBook> createState() => _DeleteBookState();
}

class _DeleteBookState extends State<DeleteBook> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IconButton(
            onPressed: () {
              //LIKE
            },
            icon: Icon(
              Icons.favorite_border,
              color: Colors.red,
              size: 32,
            )),
        SizedBox(
          height: 30,
        ),
        IconButton(
            onPressed: () {
              //DELETE FROM CART

              //VREMENO
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyOrdersPage()));
            },
            icon: Icon(
              Icons.delete_outlined,
              color: AppColors.secondaryColor,
              size: 32,
            )),
        Container(
          width: 150,
        ),
      ],
    );
  }
}
