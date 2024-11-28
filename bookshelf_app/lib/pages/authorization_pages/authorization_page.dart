import 'package:bookshelf_app/pages/authorization_pages/registration_page.dart';
import 'package:bookshelf_app/pages/main_page.dart';
import 'package:bookshelf_app/system/app_colors.dart';
import 'package:bookshelf_app/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({super.key});

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  final TextEditingController numberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
            )),
      ),
      body: Center(
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

            //INPUT FIELD
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: InputField(
                  controller: numberController,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  hintText: "Введите номер телефона или номер  билета"),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: InputField(
                  controller: passwordController,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  hintText: "Пароль"),
            ),

            SizedBox(
              height: 35,
            ),
            //BUTTONS
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
                    //ADD LOGIN FUNCTION
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage()),
                      (Route<dynamic> route) => false,
                    );
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
              height: 20,
            ),
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
                )),
          ],
        ),
      ),
    );
  }
}
