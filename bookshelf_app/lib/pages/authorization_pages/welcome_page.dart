import 'package:bookshelf_app/pages/authorization_pages/authorization_page.dart';
import 'package:bookshelf_app/pages/catalog_page.dart';
import 'package:bookshelf_app/system/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  //ADD AUTHORIZATION LOGIC

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Image.asset("assets/img/logo.png"),
          Image.asset("assets/img/welcome.png"),
          SizedBox(
            height: 8,
          ),
          Text(
            "Дорогой читатель!",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: AppColors.secondaryColor,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            width: 330,
            child: Text(
              "Откройте для себя тысячи книг, участвуйте в событиях и создавайте свою личную коллекцию. Чтение стало еще проще и доступнее!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFFC83EAA),
              ),
            ),
          ),
          SizedBox(
            height: 60,
          ),

          //BUTTON
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AuthorizationPage()));
                },
                borderRadius: BorderRadius.circular(5),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 24.0),
                  child: Center(
                    child: Text(
                      'Продолжить',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(
            height: 60,
          ),

          Text(
            "Ваша история чтения начинается здесь!",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.secondaryColor,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
