import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_way_bd_task/presentation/bindings/todo_bindigns.dart';
import 'package:it_way_bd_task/presentation/page/todo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 46, 168, 119),
        ),
        useMaterial3: true,
      ),
      initialBinding: TodoBinding(),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const TodoScreen(),
          binding: TodoBinding(),
        ),
      ],
    );
  }
}
