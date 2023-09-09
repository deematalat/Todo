import 'package:final_todo_web/todo/presentation/manager/todo_bloc.dart';
import 'package:final_todo_web/todo/presentation/widgets/srearch_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/app_theme.dart';
import '../../../core/util/snackbar_message.dart';
import '../../../core/widgets/loading_widget.dart';
import '../manager/todo_event.dart';
import '../manager/todo_state.dart';
import '../widgets/body_row.dart';
import '../widgets/header.dart';


class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final _scrollController = ScrollController();
  final _bloc = TodosBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(TodosEvent.fetch);
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_isBottom) {
      _bloc.add(TodosEvent.loadMore);
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    final delta = 100.0; // You can adjust this threshold as needed.
    return maxScroll - currentScroll <= delta;
  }
  void _onNextButtonClicked() {
    if (_bloc.hasMorePages) {
      _bloc.add(TodosEvent.loadMore);
    }
  }  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      appBar:Header(screenSize: screenSize),
      body: BlocBuilder<TodosBloc, TodosState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state == TodosState.loading && _bloc.todosWithUsers.isEmpty) {
            return LoadingWidget();
          } else if (state == TodosState.error) {
            return Text('Error loading todos');
          } else {
            return Column(
              children: [
                SearchBox(),
                 Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: _bloc.todosWithUsers.isEmpty
                        ? 0
                        : _bloc.todosWithUsers.length + (_bloc.hasMorePages ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index < _bloc.todosWithUsers.length) {
                        final item = _bloc.todosWithUsers[index];
                        final todos = item.todos;
                        final user = item.user;
                        return BodyRow(todo: todos,user: user,index:_bloc.todosWithUsers.length);
                      } else if (_bloc.hasMorePages) {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else {
                        return Container(); // No more items to load.
                      }
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
      floatingActionButton:FloatingActionButton(
        onPressed:_bloc.hasMorePages? _onNextButtonClicked:(){SnackBarMessage().showErrorSnackBar(message: "No more item", context: context);},
        child: Icon(Icons.arrow_forward),
      )
          // No more items to load, so don't show the button


    );
  }

  @override
  void dispose() {
    _bloc.close();
    _scrollController.dispose();
    super.dispose();
  }
}
