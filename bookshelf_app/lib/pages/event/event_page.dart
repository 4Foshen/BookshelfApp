// ignore_for_file: prefer_const_constructors

import 'package:bookshelf_app/pages/profile/profile_page.dart';
import 'package:bookshelf_app/system/app_colors.dart';
import 'package:bookshelf_app/system/event.dart';
import 'package:bookshelf_app/widgets/event_card.dart';
import 'package:bookshelf_app/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
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

          //MY EVENTS BUTTON HERE
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 12),
            child: Row(
              children: [
                Text(
                  "События",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 53,
                ),
                OutlinedButton(
                    onPressed: () {
                      //OPEN MY EVENTS
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
                          "Мои мероприятия",
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
          Container(
            height: 520,
            child: ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                return EventCardForList(
                  eventInfo: events[index],
                  buttonText: "Подробнее",
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
