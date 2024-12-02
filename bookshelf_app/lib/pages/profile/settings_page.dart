// ignore_for_file: prefer_const_constructors, empty_catches

import 'package:bookshelf_app/pages/authorization_pages/registration_page.dart';
import 'package:bookshelf_app/pages/main_page.dart';
import 'package:bookshelf_app/system/app_colors.dart';
import 'package:bookshelf_app/system/user_service.dart';
import 'package:bookshelf_app/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController adressController = TextEditingController();

  bool _isSwitched = false;

  Future<void> _updateData() async {
    final Map<String, dynamic> updateData = {};
    final fields = {
      "name": nameController.text.trim(),
      "surname": surnameController.text.trim(),
      "organization": positionController.text.trim(),
      "place_of_residence": adressController.text.trim(),
    };

    fields.forEach((key, value) {
      if (value.isNotEmpty) {
        updateData[key] = value;
      }
    });

    try {
      await ApiService().updateData(updateData);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Регистрация успешна!"),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (context) => MainPage()), // Укажите вашу основную страницу
        (route) => false, // Удаляет все предыдущие маршруты
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Произошла ошибка."),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          'Настройки профиля',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        backgroundColor: AppColors.backgroundColor,
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.chevron_left_rounded,
              size: 40,
              color: AppColors.secondaryColor,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CircleAvatar(
              radius: 64,
              backgroundColor: Colors.blue[100],
              child: Text(
                (UserData.currentUser?.profile.name[0] ?? '') +
                    (UserData.currentUser?.profile.surname[0] ?? ''),
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            //DATA
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.confirmation_num_outlined, size: 24),
                SizedBox(width: 4),
                Text(UserData.currentUser?.ticket ?? ""),
              ],
            ),

            //SWITCH EDIT
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text(
            //       "Уведомления",
            //       style: TextStyle(fontSize: 18),
            //     ),
            //     SizedBox(
            //       width: 150,
            //     ),
            //     Switch(
            //       value: _isSwitched,
            //       activeColor: Colors.green,
            //       onChanged: (value) {
            //         setState(() {
            //           _isSwitched = value;
            //         });
            //       },
            //     ),
            //   ],
            // ),

            //INPUT FIELDS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: InputField(
                  controller: nameController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'[a-zA-Zа-яА-Я]'),
                    )
                  ],
                  hintText: UserData.currentUser?.profile.name ?? ""),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: InputField(
                  controller: surnameController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'[a-zA-Zа-яА-Я]'),
                    )
                  ],
                  hintText: UserData.currentUser?.profile.surname ?? ""),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: InputField(
                  controller: positionController,
                  inputFormatters: [],
                  hintText: UserData.currentUser?.profile.organization ?? ""),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: InputField(
                  controller: adressController,
                  inputFormatters: [],
                  hintText:
                      UserData.currentUser?.profile.placeOfResidence ?? ""),
            ),

            SizedBox(
              height: 40,
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
                    _updateData();
                  },
                  borderRadius: BorderRadius.circular(5),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 24.0),
                    child: Center(
                      child: Text(
                        'Сохранить',
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
          ],
        ),
      ),
    );
  }
}
