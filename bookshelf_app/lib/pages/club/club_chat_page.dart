import 'package:bookshelf_app/system/app_colors.dart';
import 'package:flutter/material.dart';

class ClubChatPage extends StatefulWidget {
  final String clubName;

  const ClubChatPage({super.key, required this.clubName});

  @override
  State<ClubChatPage> createState() => _ClubChatPageState();
}

class _ClubChatPageState extends State<ClubChatPage> {
  final TextEditingController messageController = TextEditingController();

  final List<Map<String, dynamic>> messages = [
    {"username": "Данил", "message": "Кто может посоветовать что-то похожее на «451 градус по Фаренгейту»? Ищу что-то философское и глубокое."},
    {"username": "София", "message": "Начала читать «Унесенные ветром» по рекомендации клуба. Пока не могу оторваться! Кто уже прочитал? Поделитесь своими впечатлениями!"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
          "Клуб \"${widget.clubName}\"",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return MessageContainer(
                    username: messages[index]["username"],
                    time: "20:51",
                    date: "08.11.2024",
                    message: messages[index]["message"],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                        hintText: "Введите текст",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Color(0xff8102A7)),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send, color: Color(0xff8102A7)),
                    onPressed: () {
                      
                      print("Отправлено: ${messageController.text}");
                      messageController.clear();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageContainer extends StatelessWidget {
  final String username;
  final String time;
  final String date;
  final String message;

  const MessageContainer({
    Key? key,
    required this.username,
    required this.time,
    required this.date,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.account_circle, size: 30, color: Colors.grey[700]),
              const SizedBox(width: 8.0),
              Text(
                username,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              const Spacer(),
              Text(
                "$time  $date",
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Text(
            message,
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}
