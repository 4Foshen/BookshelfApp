import 'package:bookshelf_app/pages/event_page.dart';
import 'package:bookshelf_app/pages/home_page.dart';
import 'package:bookshelf_app/pages/mybook_page.dart';
import 'package:bookshelf_app/system/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List _pages = [
    HomePage(),
    MyBookPage(),
    EventPage(),
  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const CustomBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedIndex,
            onTap: onItemTapped,
            selectedItemColor: AppColors.secondaryColor,
            unselectedItemColor: AppColors.secondaryColor.withOpacity(0.6),
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
            backgroundColor: AppColors.backgroundColor,
            items: [
              BottomNavigationBarItem(
                icon: _buildNavItemIcon('assets/svg/home.svg', 0),
                label: "Главная",
              ),
              BottomNavigationBarItem(
                icon: _buildNavItemIcon('assets/svg/books2.svg', 1),
                label: "Мои книги",
              ),
              BottomNavigationBarItem(
                icon: _buildNavItemIcon('assets/svg/events.svg', 2),
                label: "Мероприятия",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItemIcon(String assetPath, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        children: [
          SvgPicture.asset(
            assetPath,
            height: 25,
          ),
          if (selectedIndex == index)
            Container(
              height: 2,
              width: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.secondaryColor,
              ),
              margin: const EdgeInsets.only(top: 4),
            ),
        ],
      ),
    );
  }
}
