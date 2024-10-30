import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookshelf_app/system/app_colors.dart';
import 'package:bookshelf_app/widgets/custom_card.dart';
import 'package:bookshelf_app/widgets/search_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //When Backend ready get from it
  final List<Map<String, String>> cardData = [
    {
      'imagePath': 'assets/img/example.jpg',
      'topText': '29.10.2024',
      'bottomText': 'Акция \"Читающая нация\"',
    },
    {
      'imagePath': 'assets/img/example.jpg',
      'topText': 'Дата 2',
      'bottomText': 'Название 2',
    },
    {
      'imagePath': 'assets/img/example.jpg',
      'topText': 'Дата 3',
      'bottomText': 'Название 3',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            //TextField
            SearchWidget(hintText: "Поиск по приложению"),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "События",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),

            //Carousel
            Center(
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  enlargeCenterPage: true,
                  autoPlay: false,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                ),
                items: cardData.map((data) {
                  return Builder(
                    builder: (BuildContext context) {
                      return EventCardWidget(
                        assetImagePath: data['imagePath']!,
                        dateText: data['topText']!,
                        eventText: data['bottomText']!,
                        buttonText: "Принять участие",
                        onButtonPressed: () {
                          print('${data['topText']} button pressed');
                        },
                        onIconPressed: () {
                          print('${data['topText']} icon pressed');
                        },
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            //IconRow
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconContainer(
                  assetPath: "assets/svg/catalog.svg",
                  text: "Каталог",
                  height: 20,
                  onButtonPressed: () {},
                ),
                IconContainer(
                  assetPath: "assets/svg/clubs.svg",
                  text: "Клубы",
                  onButtonPressed: () {},
                ),
                IconContainer(
                  assetPath: "assets/svg/paint.svg",
                  text: "Творчество",
                  onButtonPressed: () {},
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Популярное из библиотеки",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            //BookList
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BookContainer(
                  name: "451 Градус по фаренгейту",
                  genre: "роман",
                ),
                BookContainer(
                  name: "Проверка",
                  genre: "семён",
                ),
                BookContainer(
                  name: "Про",
                  genre: "антон",
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: () {},
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Все предложения",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: AppColors.secondaryColor,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class IconContainer extends StatelessWidget {
  final String assetPath;
  final String text;
  final double height;
  final VoidCallback onButtonPressed;

  const IconContainer(
      {Key? key,
      required this.assetPath,
      required this.text,
      this.height = 25,
      required this.onButtonPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 50,
      child: InkWell(
        onTap: onButtonPressed,
        child: Column(
          children: [
            Container(
              height: 30,
              width: 30,
              child: SvgPicture.asset(
                assetPath,
                height: height,
              ),
            ),
            Text(text),
          ],
        ),
      ),
    );
  }
}

class BookContainer extends StatelessWidget {
  final String name;
  final String genre;

  const BookContainer({
    Key? key,
    required this.name,
    required this.genre,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String displayName = name.length > 8 ? name.substring(0, 8) + ".." : name;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 170,
          width: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            image: DecorationImage(
              image: AssetImage("assets/img/book.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                  right: 0,
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_circle,
                        color: AppColors.primaryColor,
                        shadows: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.7),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: Offset(0, 2),
                          ),
                        ],
                      )))
            ],
          ),
        ),
        Text(
          displayName,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          genre,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: AppColors.secondaryTextColor,
          ),
        ),
      ],
    );
  }
}
