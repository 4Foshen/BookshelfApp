import 'dart:convert';
import 'package:http/http.dart' as http;
import 'book_model.dart';

class BookService {
  final String baseUrl = "http://77.246.247.118:6677/api";
  final String token; // Добавляем токен в качестве параметра конструктора

  BookService({required this.token});

  /// Метод для получения заголовков с токеном
  Map<String, String> _headers() {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token', // Добавляем Bearer Token
    };
  }

  /// Запрос на получение книг с фильтрацией
  Future<List<Book>> fetchBooks({String? search, String? locale, String? user}) async {
    final queryParams = {
      if (search != null) 'search': search,
      if (locale != null) 'locale': locale,
      if (user != null) 'user': user,
    };

    final uri = Uri.parse('$baseUrl/books').replace(queryParameters: queryParams);
    final response = await http.get(uri, headers: _headers());

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Book.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load books: ${response.body}');
    }
  }

  /// Запрос на получение книги по ID
  Future<Book> fetchBookById(int id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/books/$id'),
      headers: _headers(),
    );

    if (response.statusCode == 200) {
      return Book.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load book: ${response.body}');
    }
  }

  /// Добавление книги в избранное
  Future<void> toggleFavorites(int bookId) async {
    final response = await http.post(
      Uri.parse('$baseUrl/favorites'),
      headers: _headers(),
      body: jsonEncode({'bookId': bookId}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to add book to favorites: ${response.body}');
    }
  }

  /// Получение списка избранных книг пользователя
  Future<List<Book>> fetchFavorites() async {
    final response = await http.get(
      Uri.parse('$baseUrl/favorites'),
      headers: _headers(),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Book.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch favorites: ${response.body}');
    }
  }
}
