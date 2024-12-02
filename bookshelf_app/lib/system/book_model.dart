import 'dart:ffi';
import 'package:bookshelf_app/system/book_service.dart';
import 'package:bookshelf_app/system/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Book {
  final int bookId;
  final List<String> images;
  final String author;
  final Content content;
  final Genre genre;
  late bool hasFavorite;

  final String rating;

  Book({
    required this.bookId,
    required this.images,
    required this.author,
    required this.content,
    required this.genre,
    this.hasFavorite = false,
    this.rating = "4.7",
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      bookId: json['id'],
      images: List<String>.from(json['images']),
      author: json['author'],
      content: Content.fromJson(json['content']),
      genre: Genre.fromJson(json['genre']['content']),
      hasFavorite: json['hasFavorite']
      //rating: json['rating'],
    );
  }
}

class Content {
  final LanguageContent kz;
  final LanguageContent ru;

  Content({required this.kz, required this.ru});

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      kz: LanguageContent.fromJson(json['kz']),
      ru: LanguageContent.fromJson(json['ru']),
    );
  }
}

class LanguageContent {
  final String title;
  final String description;

  LanguageContent({required this.title, required this.description});

  factory LanguageContent.fromJson(Map<String, dynamic> json) {
    return LanguageContent(
      title: json['title'],
      description: json['description'],
    );
  }
}

class Genre {
  final String kz;
  final String ru;

  Genre({required this.kz, required this.ru});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      kz: json['kz'],
      ru: json['ru'],
    );
  }
}




class Library {
  static final BookService service =
      BookService(token: "");

  static final List<Book> _books = [];

  static final List<Book> _cart = [];
  static final List<Book> _orders = [];
  static final List<Book> _ownedBooks = [];

  static List<Book> get books => _books;
  static List<Book> get cart => _cart;
  static List<Book> get orders => _orders;
  static List<Book> get ownedBooks => _ownedBooks;

  static Future<void> loadBooks() async {
    final token = await ApiService().getToken();
    final List<Book> loadedBooks =
        await service.fetchBooks(user: token);
    
    print(loadedBooks);
    if(_books.isNotEmpty) _books.clear();
    _books.addAll(loadedBooks);
  }

  static void loadFavorites() async {}

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
}
