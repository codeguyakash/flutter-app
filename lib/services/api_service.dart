import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user.dart';

class ApiService {
  Future<User> fetchRandomUser() async {
    final response = await http.get(Uri.parse('https://randomuser.me/api/'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return User.fromJson(data['results'][0]);
    } else {
      throw Exception('Failed to load user');
    }
  }
}
