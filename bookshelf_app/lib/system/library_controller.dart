import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Book {
  final int id;
  final String bookName;
  final String author;
  final String description;
  final String genre;
  final String term;
  final String imagePath;
  final double rating;
  final bool isAvailable;
  final bool isAwaiting;
  final bool isReady;

  Book({
    required this.id,
    required this.bookName,
    required this.author,
    required this.description,
    required this.genre,
    required this.term,
    required this.imagePath,
    required this.rating,
    required this.isAvailable,
    required this.isAwaiting,
    required this.isReady,
  });

  
  Map<String, dynamic> toJson() => {
        'id': id,
        'bookName': bookName,
        'author': author,
        'description': description,
        'genre': genre,
        'term': term,
        'imagePath': imagePath,
        'rating': rating,
        'isAvailable': isAvailable,
        'isAwaiting': isAwaiting,
        'isReady': isReady,
      };

  
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      bookName: json['bookName'],
      author: json['author'],
      description: json['description'],
      genre: json['genre'],
      term: json['term'],
      imagePath: json['imagePath'],
      rating: json['rating'],
      isAvailable: json['isAvailable'],
      isAwaiting: json['isAwaiting'],
      isReady: json['isReady'],
    );
  }
}

class Library {
  static final List<Book> _books = [
    Book(
      id: 0,
      bookName: "451 Градус по фаренгейту",
      author: "Рей Бредберри",
      description:
          "«451 градус по Фаренгейту» — научно-фантастический роман-антиутопия Рэя Брэдбери...",
      genre: "Роман",
      term: "29.10.2024",
      imagePath: "assets/img/book.png",
      rating: 4.5,
      isAvailable: true,
      isAwaiting: false,
      isReady: true,
    ),
    Book(
      id: 1,
      bookName: "Дюна",
      author: "Фрэнк Герберт",
      description: "Описание",
      genre: "Фантастика",
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

  // Сохранение корзины в локальное хранилище
  static Future<void> saveCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartJson = _cart.map((book) => book.toJson()).toList();
    await prefs.setString('cart', jsonEncode(cartJson));
    print("Корзина сохранена локально.");
  }

  // Загрузка корзины из локального хранилища
  static Future<void> loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartString = prefs.getString('cart');
    if (cartString != null) {
      final List<dynamic> cartJson = jsonDecode(cartString);
      _cart.clear();
      _cart.addAll(cartJson.map((json) => Book.fromJson(json)).toList());
      print("Корзина загружена из локального хранилища.");
    }
  }

  static void addToCart(Book book) {
    if (!_cart.contains(book) && !_orders.contains(book)) {
      _cart.add(book);
      saveCart();
    } else {
      print("Эта книга уже в корзине.");
    }
  }

  static void addToOrders() {
    if (_cart.isNotEmpty) {
      _orders.addAll(_cart);
      _cart.clear();
      saveCart();
    }
  }

  static void removeFromCart(Book book) {
    _cart.remove(book);
    saveCart();
  }

  static void clearCart() {
    _cart.clear();
    saveCart();
  }

  static Book? findBookById(int id) {
    try {
      return _books.firstWhere((book) => book.id == id);
    } catch (e) {
      return null;
    }
  }
}
