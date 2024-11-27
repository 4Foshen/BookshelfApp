import 'package:bookshelf_app/pages/profile/profile_page.dart';
import 'package:bookshelf_app/system/app_colors.dart';
import 'package:bookshelf_app/system/event.dart';
import 'package:bookshelf_app/widgets/event_card.dart';
import 'package:bookshelf_app/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyEvents extends StatefulWidget {
  const MyEvents({super.key});

  @override
  State<MyEvents> createState() => _MyEventsState();
}

class _MyEventsState extends State<MyEvents> {
  List<Event> events = [
    Event(
        eventName: "Акция \"Читающая нация\"",
        description:
            "В современном мире, где технологии играют важную роль в жизни каждого, чтение книг остается важным элементом культуры и образования. Мероприятие «Читающая нация» направлено на популяризацию чтения как важного инструмента развития личности и общества в целом.",
        imagePath: "assets/img/example.jpg",
        date: "31.10.2024",
        adress: "Караганда, ул. Саттара Ерубаева, 44"),
    Event(
        eventName: "Акция \"Обмен книг\"",
        description: "Описание описание описание",
        imagePath: "assets/img/example.jpg",
        date: "01.11.2024",
        adress: "Караганда, ул. Пушкинская 52"),
  ];

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
            hintText: "Поиск по мероприятиям",
            iconButton: IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                },
                icon: Icon(Icons.person_outline_rounded, size: 36)),
          ),

      
          Container(
            height: 520,
            child: ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                return EventCardButtonForList(
                  eventInfo: events[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}