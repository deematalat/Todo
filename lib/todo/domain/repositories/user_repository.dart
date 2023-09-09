import 'dart:convert';
import 'package:http/http.dart' as http;
import '../entities/user.dart';

class UserRepository {
  final String apiUrl = 'https://jsonplaceholder.typicode.com/users';

  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => User(
        id: item['id'],
        name: item['name'],
        email: item['email'],
        username:item['username'],
          phone:item['phone'],
      )).toList();
    } else {
      throw Exception('Failed to load Users');
    }
  }
}
