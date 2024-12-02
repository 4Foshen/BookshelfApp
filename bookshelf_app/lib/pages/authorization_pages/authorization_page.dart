import 'package:bookshelf_app/pages/authorization_pages/registration_page.dart';
import 'package:bookshelf_app/pages/main_page.dart';
import 'package:bookshelf_app/system/app_colors.dart';
import 'package:bookshelf_app/system/user_service.dart';
import 'package:bookshelf_app/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({super.key});

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  final TextEditingController numberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;  // Для отображения индикатора загрузки

  // Метод для авторизации
  Future<void> _login() async {
    setState(() {
      _isLoading = true;  // Включаем индикатор загрузки
    });

    try {
      await ApiService().login(numberController.text, passwordController.text);

      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Вы успешно вошли в аккаунт!',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 3),
        ),
      );

      // Переходим на главную страницу
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
        (Route<dynamic> route) => false,
      );
    } catch (e) {
      setState(() {
        _isLoading = false;  // Отключаем индикатор загрузки
      });

      // Показываем ошибку через Snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Ошибка авторизации. Попробуйте снова.',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.chevron_left_rounded,
            size: 40,
            color: AppColors.secondaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/img/logo.png",
                scale: 0.8,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Добро пожаловать!",
                style: TextStyle(
                  color: Color(0xff9E292F),
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: 90,
              ),
        
              // Поле для ввода номера телефона
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: InputField(
                  controller: numberController,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  hintText: "Введите номер телефона или номер билета",
                ),
              ),
              SizedBox(height: 20,),
        
              // Поле для ввода пароля
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: InputField(
                  controller: passwordController,
                  inputFormatters: [
                    
                  ],
                  hintText: "Пароль",
                  obscure: true,
                ),
              ),
              SizedBox(
                height: 35,
              ),
        
              // Кнопка авторизации
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
                    onTap: _isLoading ? null : _login, // Если идет загрузка, кнопка неактивна
                    borderRadius: BorderRadius.circular(5),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 24.0),
                      child: Center(
                        child: _isLoading
                            ? CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              ) // Показываем индикатор загрузки
                            : Text(
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
                height: 20,
              ),
        
              // Кнопка регистрации
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistrationPage()));
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: AppColors.secondaryColor, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 90, vertical: 13),
                ),
                child: Text(
                  "Регистрация",
                  style: TextStyle(
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
