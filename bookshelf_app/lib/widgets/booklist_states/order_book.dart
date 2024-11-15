import 'package:bookshelf_app/pages/books/catalog_page.dart';
import 'package:bookshelf_app/system/app_colors.dart';
import 'package:bookshelf_app/system/library_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OrderBook extends StatelessWidget {
  final Book bookInfo;

  const OrderBook({required this.bookInfo, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        //READY TO GET
        if (bookInfo.isAvailable && bookInfo.isReady)
          Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.done_all,
                    color: AppColors.secondaryColor,
                    size: 24,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Готов к выдаче",
                    style: TextStyle(
                      color: AppColors.secondaryColor,
                    ),
                  )
                ],
              ),
              SizedBox(height: 8,),
              OutlinedButton(
                  onPressed: () {
                    //CANCEL ORDER
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColors.secondaryColor, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                  ),
                  child: Text(
                    "Отменить",
                    style: TextStyle(
                      color: AppColors.secondaryColor,
                    ),
                  )),
            ],
          ),
      
        //NOT AVAILABLE
        if(!bookInfo.isAvailable)
          Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.cancel_outlined,
                    color: AppColors.textColor,
                    size: 24,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Нет в наличии",
                    style: TextStyle(
                      color: AppColors.textColor,
                    ),
                  )
                ],
              ),
              MaterialButton(onPressed: () {
                //ADD REMOVING FUNCTION
                Navigator.push(context, MaterialPageRoute(builder: (context) => CatalogPage()));
              },
              minWidth: 150,
              height: 38,
              elevation: 0,
              child: Text("Взять другую"),
              color: AppColors.primaryColor,),
              OutlinedButton(
                  onPressed: () {
                    //CANCEL ORDER
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColors.secondaryColor, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                  ),
                  child: Text(
                    "Отменить",
                    style: TextStyle(
                      color: AppColors.secondaryColor,
                    ),
                  )),
            ],
          ),


        //WAITING FOR BOOK
        if(bookInfo.isAwaiting && bookInfo.isAvailable && !bookInfo.isReady)
          Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.timer_outlined,
                    color: AppColors.textColor,
                    size: 24,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Ожидание",
                    style: TextStyle(
                      color: AppColors.textColor,
                    ),
                  )
                ],
              ),
              MaterialButton(onPressed: () {
                //ADD REMOVING FUNCTION
                Navigator.push(context, MaterialPageRoute(builder: (context) => CatalogPage()));
              },
              minWidth: 150,
              height: 38,
              elevation: 0,
              child: Text("Взять другую"),
              color: AppColors.primaryColor,),
              
              OutlinedButton(
                  onPressed: () {
                    //CANCEL ORDER
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColors.secondaryColor, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                  ),
                  child: Text(
                    "Отменить",
                    style: TextStyle(
                      color: AppColors.secondaryColor,
                    ),
                  )),
            ],
          )
      ],
    );
  }
}
