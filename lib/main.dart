import 'package:final_todo_web/todo/presentation/manager/todo_bloc.dart';
import 'package:final_todo_web/todo/presentation/pages/todo_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/app_theme.dart';


void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(BlocProvider(
    create: (context) => TodosBloc(),
    child: MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return ScreenUtilInit(
        designSize: const Size(1536, 739),
    builder: (_ , child) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme:  appTheme,
      home:TodoListPage(), // Your initial page/widget

    );});
  }
}
