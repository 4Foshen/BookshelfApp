// ignore_for_file: prefer_const_constructors

import 'package:bookshelf_app/pages/club/club_list_page.dart';
import 'package:bookshelf_app/system/app_colors.dart';
import 'package:flutter/material.dart';


class MyClubs extends StatefulWidget {
  const MyClubs({super.key});

  @override
  State<MyClubs> createState() => _MyClubsState();
}

class _MyClubsState extends State<MyClubs> {
  final List<Map<String, dynamic>> clubs = [
    {"clubName": "Мир страниц", "peopleAmount": 18},
    {"clubName": "Книжный мост", "peopleAmount": 25},
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
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          //NAME
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Text(
              "Мои клубы",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),

          //CLUB LIST
          Container(
            height: 550,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1.3, 
                ),
                itemCount: clubs.length,
                itemBuilder: (context, index) {
                  return ClubCard(
                    clubName: clubs[index]["clubName"],
                    peopleAmount: clubs[index]["peopleAmount"],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}