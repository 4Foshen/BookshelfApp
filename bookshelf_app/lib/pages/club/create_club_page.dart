import 'package:bookshelf_app/system/app_colors.dart';
import 'package:bookshelf_app/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateClubPage extends StatefulWidget {
  const CreateClubPage({super.key});

  @override
  State<CreateClubPage> createState() => _CreateClubPageState();
}

class _CreateClubPageState extends State<CreateClubPage> {
  final TextEditingController themeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

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
          "Создать книжный клуб",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //TITLE
            SizedBox(
              height: 30,
            ),
            Center(
                child: SvgPicture.asset(
              "assets/svg/clubs.svg",
              width: 60,
            )),
            Center(
              child: Text(
                "Дорогой читатель!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: AppColors.secondaryColor,
                ),
              ),
            ),
            Center(
              child: Container(
                width: 300,
                child: Text(
                  "Клуб будет создан после одобрения модератора приложения!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xffC83EAA),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 80,
            ),

            //INPUT FIELDS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "Введите тему клуба",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: InputField(
                  controller: themeController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'[a-zA-Zа-яА-Я]'),
                    )
                  ],
                  hintText: ""),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "Введите описание клуба",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: MultilineInputField(
                  controller: descriptionController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'[a-zA-Zа-яА-Я]'),
                    )
                  ],
                  hintText: ""),
            ),

            SizedBox(height: 40,),

            //BUTTON
            Center(
            child: Container(
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
                      //CREATE CLUB
                    },
                    borderRadius: BorderRadius.circular(5),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 24.0),
                      child: Center(
                        child: Text(
                          'Создать клуб',
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
          ),
          ],
        ),
      ),
    );
  }
}
