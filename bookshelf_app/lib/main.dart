// ignore_for_file: prefer_const_constructors

import 'package:bookshelf_app/pages/authorization_pages/welcome_page.dart';
import 'package:bookshelf_app/pages/home_page.dart';
import 'package:bookshelf_app/pages/main_page.dart';
import 'package:bookshelf_app/system/book_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Manrope'),
      routes: {
        '/homepage': (context) => MainPage(),
      },
      home: HomePageLoader(), // Загружаем HomePageLoader
    );
  }
}

class HomePageLoader extends StatelessWidget {
  const HomePageLoader({super.key});

  Future<bool> _checkToken() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('auth_token'); // Получаем токен
    return token != null && token.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _checkToken(), // Асинхронно проверяем наличие токена
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()), // Показываем индикатор загрузки
          );
        } else if (snapshot.hasError || !snapshot.hasData || !snapshot.data!) {
          return WelcomePage(); // Если токен отсутствует или ошибка, показываем WelcomePage
        } else {
          return MainPage(); // Если токен есть, показываем MainPage
        }
      },
    );
  }
}
