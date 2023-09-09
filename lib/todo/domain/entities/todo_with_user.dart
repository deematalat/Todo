import 'package:final_todo_web/todo/domain/entities/todo.dart';
import 'package:final_todo_web/todo/domain/entities/user.dart';

class TodoWithUser {
  final List<Todo> todos;
  final User user;
  TodoWithUser({
    required this.todos,
    required this.user,
  });
}
