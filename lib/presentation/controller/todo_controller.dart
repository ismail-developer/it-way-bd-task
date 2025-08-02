import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_way_bd_task/core/utils/custom_snackbar.dart';
import 'package:it_way_bd_task/domain/entities/todo_entity.dart';
import 'package:it_way_bd_task/domain/usecase/add_todo.dart';
import 'package:it_way_bd_task/domain/usecase/delete_todo.dart';
import 'package:it_way_bd_task/domain/usecase/get_todo.dart';
import 'package:it_way_bd_task/domain/usecase/toggle._todo.dart';
import 'package:it_way_bd_task/domain/usecase/update_todo.dart';

class TodoController extends GetxController {
  final GetTodos getTodos;
  final AddTodo addTodo;
  final UpdateTodo updateTodo;
  final ToggleTodo toggleTodo;
  final DeleteTodo deleteTodo;

  final todos = <TodoEntity>[].obs;
  final isLoading = false.obs;
  final taskTextEditingController = TextEditingController();

  TodoController(this.getTodos, this.addTodo, this.updateTodo, this.toggleTodo,
      this.deleteTodo);

  @override
  void onInit() {
    fetchTodos();
    super.onInit();
  }

  Future<void> fetchTodos() async {
    isLoading.value = true;
    try {
      todos.value = await getTodos();
    } catch (e) {
      // Error already shown in TodoApiService via Get.snackbar
    }
    isLoading.value = false;
  }

  Future<void> addNewTodo(String title) async {
    if (title.isEmpty) return;
    try {
      final newTodo = await addTodo(title);
      todos.add(newTodo);
      CustomSnackbar.showSnackbar('Todo added successfully');
    } catch (e) {
      // Error already shown in TodoApiService via Get.snackbar
    }
  }

  Future<void> updateExistingTodo(String id, String title) async {
    try {
      final updatedTodo = await updateTodo(id, title);
      final index = todos.indexWhere((todo) => todo.id == id);
      if (index != -1) {
        todos[index] = updatedTodo;
      } else {
        todos.add(updatedTodo);
      }
      CustomSnackbar.showSnackbar('Todo updated successfully');
    } catch (e) {
      // Error already shown in TodoApiService via Get.snackbar
    }
  }

  Future<void> toggleTodoCompletion(String id, bool completed) async {
    try {
      final updatedTodo = await toggleTodo(id, completed);
      final index = todos.indexWhere((todo) => todo.id == id);
      if (index != -1) {
        todos[index] = updatedTodo;
      } else {
        todos.add(updatedTodo);
      }
      CustomSnackbar.showSnackbar('Todo status updated successfully');
    } catch (e) {
      // Error already shown in TodoApiService via Get.snackbar
    }
  }

  Future<void> deleteExistingTodo(String id) async {
    try {
      await deleteTodo(id);
      todos.removeWhere((todo) => todo.id == id);
      CustomSnackbar.showSnackbar('Todo deleted successfully');
    } catch (e) {
      // Error already shown in TodoApiService via Get.snackbar
    }
  }
}
