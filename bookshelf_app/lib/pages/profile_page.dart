import 'package:bookshelf_app/system/app_colors.dart';
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
            icon: Icon(Icons.edit_outlined, size: 28,),
            onPressed: () {
              // Действие для редактирования профиля
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
                    //PICK INITIAL OF NAME AND SURNAME
                    'КД',
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
                      'Калайда Данил',
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
                        Text('067123'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.phone_outlined, size: 20),
                        SizedBox(width: 4),
                        Text('8 707 123 65 65'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),

            //CHANGE LANGUAGE
            ListTile(
              title: Text('Язык приложения', style: TextStyle(
                fontWeight: FontWeight.bold,
              ),),
              subtitle: Text('Русский'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Переход к настройкам языка
              },
            ),
            SizedBox(height: 8),

            _buildMenuItem(
              icon: Icon(Icons.favorite_outline, color: AppColors.secondaryColor,),
              text: 'Избранное',
              onTap: () {
                // Действие для избранного
              },
            ),
            _buildMenuItem(
              icon: SvgPicture.asset('assets/svg/books2.svg'),
              text: 'Мои книги',
              onTap: () {
                // Действие для книг
              },
            ),
            _buildMenuItem(
              icon: SvgPicture.asset('assets/svg/events.svg'),
              text: 'Мои мероприятия',
              onTap: () {
                // Действие для мероприятий
              },
            ),
            _buildMenuItem(
              icon: SvgPicture.asset('assets/svg/clubs.svg'),
              text: 'Мои клубы',
              onTap: () {
                // Действие для клубов
              },
            ),
            _buildMenuItem(
              icon: SvgPicture.asset('assets/svg/paint.svg', height: 28,),
              text: 'Мое творчество',
              onTap: () {
                // Действие для творчества
              },
            ),
            _buildMenuItem(
              icon: Icon(Icons.exit_to_app_rounded, color: Colors.red, size: 26,),
              text: 'Выйти',
              onTap: () {
                // Действие для выхода из аккаунта
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
      title: Text(text, style: TextStyle(
        color: Color(0xff424242),
        fontWeight: FontWeight.bold,
      ),),
      onTap: onTap,
    );
  }
}
