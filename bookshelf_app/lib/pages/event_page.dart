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
        description: "Описание",
        imagePath: "assets/img/example.jpg",
        date: "31.10.2024"),
    Event(
        eventName: "Акция \"Обмен книг\"",
        description: "Описание описание описание",
        imagePath: "assets/img/example.jpg",
        date: "01.11.2024"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          SearchWidget(hintText: "Поиск по мероприятиям"),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Text(
                  "События",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 80,
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
                    onButtonPressed: () {},
                    onIconPressed: () {},);
              },
            ),
          )
        ],
      ),
    );
  }
}
