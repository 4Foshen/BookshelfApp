// ignore_for_file: prefer_const_constructors

import 'package:bookshelf_app/system/app_colors.dart';
import 'package:bookshelf_app/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController adressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                color: AppColors.secondaryColor,
              )),
          title: Text(
            "Регистрация",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
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
                  scale: 1,
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
                Text(
                  "Для регистрации введите свои данные",
                  style: TextStyle(
                    color: Color(0xffC83EAA),
                    fontSize: 16,
                  ),
                ),

                SizedBox(
                  height: 30,
                ),

                //INPUT FIELDS
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: InputField(
                      controller: nameController,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'[a-zA-Zа-яА-Я]'),
                        )
                      ],
                      hintText: "Введите свое имя"),
                ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: InputField(
                      controller: surnameController,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'[a-zA-Zа-яА-Я]'),
                        )
                      ],
                      hintText: "Введите свою фамилию"),
                ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: InputField(
                      controller: positionController,
                      inputFormatters: [],
                      hintText: "Ваше место учебы/работы"),
                ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: InputField(
                      controller: numberController,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      hintText: "Введите номер телефона "),
                ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: InputField(
                      controller: adressController,
                      inputFormatters: [],
                      hintText: "Адрес проживания"),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: InputField(
                      controller: passwordController,
                      inputFormatters: [],
                      hintText: "Пароль"),
                ),


                SizedBox(height: 43,),

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
                        //ADD REGISTRATION FUNCTION
                      },
                      borderRadius: BorderRadius.circular(5),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 24.0),
                        child: Center(
                          child: Text(
                            'Зарегистрироваться',
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
              ])),
        ));
  }
}
