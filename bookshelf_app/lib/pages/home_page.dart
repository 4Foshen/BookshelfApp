import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookshelf_app/pages/book_page.dart';
import 'package:bookshelf_app/pages/catalog_page.dart';
import 'package:bookshelf_app/pages/profile_page.dart';
import 'package:bookshelf_app/system/app_colors.dart';
import 'package:bookshelf_app/system/book.dart';
import 'package:bookshelf_app/system/event.dart';
import 'package:bookshelf_app/widgets/event_card.dart';
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
  List<Event> events = [
    Event(
        eventName: "Акция \"Читающая нация\"",
        description: "В современном мире, где технологии играют важную роль в жизни каждого, чтение книг остается важным элементом культуры и образования. Мероприятие «Читающая нация» направлено на популяризацию чтения как важного инструмента развития личности и общества в целом.",
        imagePath: "assets/img/example.jpg",
        date: "31.10.2024",
        adress: "Караганда, ул. Саттара Ерубаева, 44"),
    Event(
        eventName: "Акция \"Обмен книг\"",
        description: "Описание описание описание",
        imagePath: "assets/img/example.jpg",
        date: "01.11.2024",
        adress: "Караганда, ул. Пушкинская 52"),
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
            SearchWidget(hintText: "Поиск по приложению", iconButton: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
            },
            icon: Icon(Icons.person_outline_rounded, size: 36)),),

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
                items: events.map((data) {
                  return Builder(
                    builder: (BuildContext context) {
                      return EventCardWidget(
                        eventInfo: data,
                        buttonText: "Принять участие",
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
                  onButtonPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context) => CatalogPage(),));
                  },
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

            //POPULAR FROM LIBRARY
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

            //CHANGE AFTER BACKEND
            //BookList
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BookContainer(
                  bookInfo: Book(
                      bookName: "451 Градус по фаренгейту",
                      author: "Рэй Брэдбери",
                      description: "Описание",
                      genre: "роман",
                      term: "30.10.2024",
                      imagePath: "assets/img/book.png",
                      rating: 4.6,
                      isAvailable: true,
                      isAwaiting: false,
                      isReady: true),
                ),
                BookContainer(
                  bookInfo: Book(
                      bookName: "451 Градус по фаренгейту",
                      author: "Рэй Брэдбери",
                      description: "Описание",
                      term: "01.11.2024",
                      genre: "роман",
                      imagePath: "assets/img/book.png",
                      rating: 4.6,
                      isAvailable: true,
                      isAwaiting: false,
                      isReady: true),
                ),
                BookContainer(
                  bookInfo: Book(
                      bookName: "451 Градус по фаренгейту",
                      author: "Рэй Брэдбери",
                      description: "Описание",
                      genre: "роман",
                      term: "01.11.2024",
                      imagePath: "assets/img/book.png",
                      rating: 4.6,
                      isAvailable: true,
                      isAwaiting: false,
                      isReady: true),
                ),
              ],
            ),

            //ALL VARIANTS
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context) => CatalogPage(),));
                },
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
  final Book bookInfo;

  const BookContainer({
    Key? key,
    required this.bookInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String displayName = bookInfo.bookName.length > 8
        ? bookInfo.bookName.substring(0, 8) + ".."
        : bookInfo.bookName;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookPage(
                  bookInfo: bookInfo,
                ),
              ),
            );
          },
          child: Container(
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
                        onPressed: () {
                          //Add to korzina emae
                        },
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
        ),
        Text(
          displayName,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          bookInfo.genre,
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
