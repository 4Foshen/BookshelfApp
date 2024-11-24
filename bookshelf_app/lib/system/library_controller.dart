import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Book {
  final int id;
  final String author;
  final Content ruContent;
  final Content kzContent;
  final String term; //Srok
  final String imagePath;
  final double rating;
  final bool isAvailable;
  final bool isAwaiting;
  final bool isReady;
  final bool isFavorite;

  Book({
    required this.id,
    required this.author,
    required this.term,
    required this.ruContent,
    required this.kzContent,
    required this.imagePath,
    required this.rating,
    required this.isAvailable,
    required this.isAwaiting,
    required this.isReady,
    this.isFavorite = false,
  });
}

class Content{
  final String bookName;
  final String description;
  final String genre;

  Content({
    required this.bookName,
    required this.description,
    required this.genre,
  });
}

class Library {
  static final List<Book> _books = [
    Book(
      id: 0,
      author: "Рей Бредберри",
      term: "29.10.2024",
      ruContent: Content(
        bookName: "451 Градус по фаренгейту", 
        description: "«451 градус по Фаренгейту» — научно-фантастический роман-антиутопия Рэя Брэдбери...", 
        genre: "Роман"
        ),
      kzContent: Content(
        bookName: "Название на казахском", 
        description: "Описание на казахском", 
        genre: "Жанр на казахском"),
      imagePath: "assets/img/book.png",
      rating: 4.5,
      isAvailable: true,
      isAwaiting: false,
      isReady: true,
    ),
    Book(
      id: 1,
      author: "Фрэнк Герберт",
      ruContent: Content(
        bookName: "Дюна", 
        description: "Описание", 
        genre: "Фантастика"),
      kzContent: Content(
        bookName: "ДюнаКЗ", 
        description: "ОписаниеКЗ", 
        genre: "ЖанрКЗ"),
      term: "12.11.2024",
      imagePath: "assets/img/book.png",
      rating: 4.7,
      isAvailable: true,
      isAwaiting: true,
      isReady: false,
    ),
  ];

  static final List<Book> _cart = [];
  static final List<Book> _orders = [];
  static final List<Book> _ownedBooks = [];

  static List<Book> get books => _books;
  static List<Book> get cart => _cart;
  static List<Book> get orders => _orders;
  static List<Book> get ownedBooks => _ownedBooks;

  

  static void addToCart(Book book) {
    if (!_cart.contains(book) && !_orders.contains(book)) {
      _cart.add(book);
    } else {
      print("Эта книга уже в корзине.");
    }
  }

  static void addToOrders() {
    if (_cart.isNotEmpty) {
      _orders.addAll(_cart);
      _cart.clear();
    }
  }

  static void removeFromCart(Book book) {
    _cart.remove(book);
  }

  static void clearCart() {
    _cart.clear();
  }

  static Book? findBookById(int id) {
    try {
      return _books.firstWhere((book) => book.id == id);
    } catch (e) {
      return null;
    }
  }
}
