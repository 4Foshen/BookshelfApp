// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'package:bookshelf_app/pages/art/my_art.dart';
import 'package:bookshelf_app/pages/authorization_pages/welcome_page.dart';
import 'package:bookshelf_app/pages/books/favorite_page.dart';
import 'package:bookshelf_app/pages/books/mybook_page.dart';
import 'package:bookshelf_app/pages/profile/my_clubs.dart';
import 'package:bookshelf_app/pages/profile/my_events.dart';
import 'package:bookshelf_app/pages/profile/settings_page.dart';
import 'package:bookshelf_app/system/app_colors.dart';
import 'package:bookshelf_app/system/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          'Профиль',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        backgroundColor: AppColors.backgroundColor,
        actions: [
          IconButton(
            icon: Icon(
              Icons.edit_outlined,
              size: 28,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsPage(),
                  ));
            },
          ),
        ],
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.chevron_left_rounded,
              size: 40,
              color: AppColors.secondaryColor,
            )),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //USER DATA
            Row(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.blue[100],
                  child: Text(
                    (UserData.currentUser?.profile.name[0] ?? 'Н') +
                        (UserData.currentUser?.profile.surname[0] ?? 'П'),
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      (UserData.currentUser?.profile.name ?? "Неизвестный") +
                          " " +
                          (UserData.currentUser?.profile.surname ??
                              "пользователь"),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.confirmation_num_outlined, size: 20),
                        SizedBox(width: 4),
                        Text(UserData.currentUser?.ticket ?? ""),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.phone_outlined, size: 20),
                        SizedBox(width: 4),
                        Text(UserData.currentUser?.phone ?? ""),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),

            //CHANGE LANGUAGE
            // ListTile(
            //   title: Text('Язык приложения', style: TextStyle(
            //     fontWeight: FontWeight.bold,
            //   ),),
            //   subtitle: Text('Русский'),
            //   trailing: Icon(Icons.arrow_forward_ios, size: 16),
            //   onTap: () {
            //     // Переход к настройкам языка
            //   },
            // ),
            SizedBox(height: 8),

            _buildMenuItem(
              icon: Icon(
                Icons.favorite_outline,
                color: AppColors.secondaryColor,
              ),
              text: 'Избранное',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FavoritePage()));
              },
            ),
            _buildMenuItem(
              icon: SvgPicture.asset('assets/svg/books2.svg'),
              text: 'Мои книги',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyBookPage()));
              },
            ),
            _buildMenuItem(
              icon: SvgPicture.asset('assets/svg/events.svg'),
              text: 'Мои мероприятия',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyEvents()));
              },
            ),
            // _buildMenuItem(
            //   icon: SvgPicture.asset('assets/svg/clubs.svg'),
            //   text: 'Мои клубы',
            //   onTap: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => MyClubs()));
            //   },
            // ),
            _buildMenuItem(
              icon: SvgPicture.asset(
                'assets/svg/paint.svg',
                height: 28,
              ),
              text: 'Мое творчество',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyArt()));
              },
            ),
            _buildMenuItem(
              icon: Icon(
                Icons.exit_to_app_rounded,
                color: Colors.red,
                size: 26,
              ),
              text: 'Выйти',
              onTap: () async {
                await ApiService().logout();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomePage()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required Widget icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: icon,
      title: Text(
        text,
        style: TextStyle(
          color: Color(0xff424242),
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }
}
