// ignore_for_file: prefer_const_constructors

import 'package:bookshelf_app/system/app_colors.dart';
import 'package:bookshelf_app/system/art.dart';
import 'package:flutter/material.dart';

class ArtPage extends StatefulWidget {
  const ArtPage({super.key});

  @override
  State<ArtPage> createState() => _ArtPageState();
}

class _ArtPageState extends State<ArtPage> {
  List<Art> arts = [
    Art(
        id: 0,
        imagePath: 'assets/img/art1.png',
        name: "Вечер в парке",
        author: "Айнур Имантаева",
        likes: 23),
    Art(
        id: 0,
        imagePath: 'assets/img/art2.png',
        name: "Какие то завитушки",
        author: "Ван Гог",
        likes: 52),
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
        title: Text(
          "Творческие работы",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 700,
            child: ListView.builder(
              itemCount: arts.length,
              itemBuilder: (context, index) {
                return ArtCard(
                  artData: arts[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class ArtCard extends StatelessWidget {
  final Art artData;

  const ArtCard({super.key, required this.artData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 350,
          height: 250,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(artData.imagePath), fit: BoxFit.cover)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    artData.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xffC83EAA),
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.person_outlined,
                        size: 30,
                      ),
                      Text(artData.author, style: TextStyle(
                        fontSize: 14,
                      ),)
                    ],
                  ),
                ],
              ),
              Spacer(),
              Row(
                    children: [
                      Icon(
                        Icons.favorite_border,
                        size: 30,
                        color: Color(0XFFFF5959),
                      ),
                      Text(artData.likes.toString(), style: TextStyle(
                        fontSize: 16,
                      ),)
                    ],
                  ),
            ],
          ),
        ),
        SizedBox(height: 30,),
      ],
    );
  }
}
