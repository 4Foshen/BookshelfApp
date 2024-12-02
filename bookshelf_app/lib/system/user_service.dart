import 'dart:convert';
import 'package:bookshelf_app/system/book_model.dart';
import 'package:bookshelf_app/system/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  static User? currentUser;
}

class ApiService {
  final String baseUrl = 'http://77.246.247.118:6677/api';

  Future<String?> login(String phone, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'phone': phone,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final token = response.body; // Получаем токен из ответа
      await saveToken(token); // Сохраняем токен
      return token;
    } else {
      throw Exception('Failed to login: ${response.body}');
    }
  }

  Future<void> register(Map<String, dynamic> userData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(userData),
    );

    if (response.statusCode == 201) {
      final token = response.body;
      await saveToken(token);
    } else {
      throw Exception('Failed to register: ${response.body}');
    }
  }

  Future<User> getProfile() async {
    final token = await getToken();
    if (token == null) {
      throw Exception('No token found');
    }

    final response = await http.get(
      Uri.parse('$baseUrl/users/profile'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final user = User.fromJson(data);

      // Обновляем данные пользователя в статичном классе
      UserData.currentUser = user;

      return user;
    } else {
      throw Exception('Failed to fetch profile: ${response.body}');
    }
  }

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');

    UserData.currentUser = null;
    Library.clearCart();
  }

  Future<void> updateData(Map<String, dynamic> userData) async {
    final token = await getToken();
    if (token == null) {
      throw Exception('No token found');
    }

    final response = await http.patch(
      Uri.parse('$baseUrl/profiles'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(userData),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to register: ${response.body}');
    } else {
      await getProfile();
    }
  }
}
