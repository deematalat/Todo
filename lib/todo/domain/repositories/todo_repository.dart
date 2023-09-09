import '../entities/todo.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TodoRepository {
  final String apiUrl = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<Todo>> fetchTodos(int page) async {
    final response = await http.get(Uri.parse('$apiUrl?_page=$page&_limit=100'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => Todo(
        id: item['id'],
        userId: item['userId'],
        title: item['title'],
        completed: item['completed'],
      )).toList();
    } else {
      throw Exception('Failed to load Todos');
    }
  }
}
