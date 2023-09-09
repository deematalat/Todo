import '../entities/todo.dart';
import '../entities/todo_with_user.dart';
import '../entities/user.dart';
import '../repositories/todo_repository.dart';
import '../repositories/user_repository.dart';

class GetTodosUseCase {
  final TodoRepository _todoRepository = TodoRepository();
  final UserRepository _userRepository = UserRepository();

  Future<List<TodoWithUser>> execute(int page) async {
    final users = await _userRepository.fetchUsers();
    final todos = await _todoRepository.fetchTodos(page);

    final todosWithUsers = <User, List<Todo>>{};

    for (final todo in todos) {
      final user = users.firstWhere((user) => user.id == todo.userId);
      todosWithUsers.putIfAbsent(user, () => []).add(todo);
    }

    // Flatten to list
    return todosWithUsers.entries
        .map((entry) => TodoWithUser(user: entry.key,todos: entry.value))
        .toList();
  }
}
