import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_todo_web/todo/presentation/manager/todo_event.dart';
import 'package:final_todo_web/todo/presentation/manager/todo_state.dart';

import '../../domain/entities/todo_with_user.dart';
import '../../domain/use_cases/get_todos_usecase.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final GetTodosUseCase _getTodosUseCase = GetTodosUseCase();
  List<TodoWithUser> _todosWithUsers = [];
  int _currentPage = 1;
  bool _hasMorePages = true;

  TodosBloc() : super(TodosState.loading) {
    on<TodosEvent>((event, emit) {
      if (event == TodosEvent.fetch) {
        _handleFetchEvent(emit);
      } else if (event == TodosEvent.loadMore) {
        _handleLoadMoreEvent(emit);
      }
    });
  }
  Future<void> _handleFetchEvent(Emitter<TodosState> emit) async {
    emit(TodosState.loading);
    try {
      final result = await _getTodosUseCase.execute(_currentPage); // Fetch data here
      if (result.isNotEmpty) {
        _todosWithUsers = result;
        emit(TodosState.loaded);
      } else {
        // Handle the case where no data is fetched (e.g., empty list)
        emit(TodosState.loaded);
      }
    } catch (e) {
      emit(TodosState.error);
    }
  }


  Future<void> _handleLoadMoreEvent(Emitter<TodosState> emit) async {
    emit(TodosState.loading);
    _currentPage++;
    try {
      final moreTodos = await _getTodosUseCase.execute(_currentPage); // Load more data here
      if (moreTodos.isNotEmpty) {
        _todosWithUsers.addAll(moreTodos);
        emit(TodosState.loaded);
      } else {
        // Indicate that there are no more pages to load
        emit(TodosState.noMorePages);
      }
    } catch (e) {
      _currentPage--;
      emit(TodosState.error);
    }
  }

  @override
  Stream<TodosState> mapEventToState(TodosEvent event) async* {
    if (event == TodosEvent.fetch) {
      try {
        _todosWithUsers = await _getTodosUseCase.execute(_currentPage);
        yield TodosState.loaded;
      } catch (e) {
        yield TodosState.error;
      }
    } else if (event == TodosEvent.loadMore && _hasMorePages) {
      _currentPage++;
      try {
        final moreTodos = await _getTodosUseCase.execute(_currentPage);
        if (moreTodos.isEmpty) {
          _hasMorePages = false;
        } else {
          _todosWithUsers.addAll(moreTodos);
        }
        yield TodosState.loaded;
      } catch (e) {
        _currentPage--;
        yield TodosState.error;
      }
    }
  }

  bool get hasMorePages => _hasMorePages;
  List<TodoWithUser> get todosWithUsers => _todosWithUsers;
}