import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_way_bd_task/domain/entities/todo_entity.dart';
import 'package:it_way_bd_task/domain/usecase/add_todo.dart';
import 'package:it_way_bd_task/domain/usecase/delete_todo.dart';
import 'package:it_way_bd_task/domain/usecase/get_todo.dart';
import 'package:it_way_bd_task/domain/usecase/toggle._todo.dart';
import 'package:it_way_bd_task/domain/usecase/update_todo.dart';


/* class TodoController extends GetxController {
  final GetTodos getTodos;
  final AddTodo addTodo;
  final UpdateTodo updateTodo;
  final ToggleTodo toggleTodo;
  final DeleteTodo deleteTodo;

  final todos = <TodoEntity>[].obs;
  final isLoading = false.obs;
  final taskTextEditingController = TextEditingController();

  TodoController(this.getTodos, this.addTodo, this.updateTodo, this.toggleTodo, this.deleteTodo);

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
    isLoading.value = true;
    try {
      final newTodo = await addTodo(title);
      todos.add(newTodo);
    } catch (e) {
      // Error already shown in TodoApiService via Get.snackbar
    }
    isLoading.value = false;
  }

  Future<void> updateExistingTodo(int id, String title) async {
    isLoading.value = true;
    try {
      final updatedTodo = await updateTodo(id, title);
      final index = todos.indexWhere((todo) => todo.id == id);
      if (index != -1) {
        todos[index] = updatedTodo;
      }
    } catch (e) {
      // Error already shown in TodoApiService via Get.snackbar
    }
    isLoading.value = false;
  }

  Future<void> toggleTodoCompletion(int id, bool completed) async {
    isLoading.value = true;
    try {
      final updatedTodo = await toggleTodo(id, completed);
      final index = todos.indexWhere((todo) => todo.id == id);
      if (index != -1) {
        todos[index] = updatedTodo;
      }
    } catch (e) {
      // Error already shown in TodoApiService via Get.snackbar
    }
    isLoading.value = false;
  }

  Future<void> deleteExistingTodo(int id) async {
    isLoading.value = true;
    try {
      await deleteTodo(id);
      todos.removeWhere((todo) => todo.id == id);
    } catch (e) {
      // Error already shown in TodoApiService via Get.snackbar
    }
    isLoading.value = false;
  }
} */


/* class TodoController extends GetxController {
  final GetTodos getTodos;
  final AddTodo addTodo;
  final UpdateTodo updateTodo;
  final ToggleTodo toggleTodo;
  final DeleteTodo deleteTodo;

  final todos = <TodoEntity>[].obs;
  final isLoading = false.obs;
  final taskTextEditingController = TextEditingController();

  TodoController(this.getTodos, this.addTodo, this.updateTodo, this.toggleTodo, this.deleteTodo);

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
    isLoading.value = true;
    try {
      final newTodo = await addTodo(title);
      todos.add(newTodo);
    } catch (e) {
      // Error already shown in TodoApiService via Get.snackbar
    }
    isLoading.value = false;
  }

  Future<void> updateExistingTodo(int id, String title) async {
    isLoading.value = true;
    try {
      final updatedTodo = await updateTodo(id, title);
      final index = todos.indexWhere((todo) => todo.id == id);
      if (index != -1) {
        todos[index] = updatedTodo;
      } else {
        todos.add(updatedTodo); // Add if not found (for local updates)
      }
    } catch (e) {
      // Error already shown in TodoApiService via Get.snackbar
    }
    isLoading.value = false;
  }

  Future<void> toggleTodoCompletion(int id, bool completed) async {
    isLoading.value = true;
    try {
      final updatedTodo = await toggleTodo(id, completed);
      final index = todos.indexWhere((todo) => todo.id == id);
      if (index != -1) {
        todos[index] = updatedTodo;
      } else {
        todos.add(updatedTodo); // Add if not found (for local updates)
      }
    } catch (e) {
      // Error already shown in TodoApiService via Get.snackbar
    }
    isLoading.value = false;
  }

  Future<void> deleteExistingTodo(int id) async {
    isLoading.value = true;
    try {
      await deleteTodo(id);
      todos.removeWhere((todo) => todo.id == id);
    } catch (e) {
      // Error already shown in TodoApiService via Get.snackbar
    }
    isLoading.value = false;
  }
} */


class TodoController extends GetxController {
  final GetTodos getTodos;
  final AddTodo addTodo;
  final UpdateTodo updateTodo;
  final ToggleTodo toggleTodo;
  final DeleteTodo deleteTodo;

  final todos = <TodoEntity>[].obs;
  final isLoading = false.obs;
  final taskTextEditingController = TextEditingController();

  TodoController(this.getTodos, this.addTodo, this.updateTodo, this.toggleTodo, this.deleteTodo);

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
    isLoading.value = true;
    try {
      final newTodo = await addTodo(title);
      todos.add(newTodo);
      Get.snackbar('Success', 'Todo added successfully');
    } catch (e) {
      // Error already shown in TodoApiService via Get.snackbar
    }
    isLoading.value = false;
  }

  Future<void> updateExistingTodo(String id, String title) async {
    isLoading.value = true;
    try {
      final updatedTodo = await updateTodo(id, title);
      final index = todos.indexWhere((todo) => todo.id == id);
      if (index != -1) {
        todos[index] = updatedTodo;
      } else {
        todos.add(updatedTodo);
      }
      Get.snackbar('Success', 'Todo updated successfully');
    } catch (e) {
      // Error already shown in TodoApiService via Get.snackbar
    }
    isLoading.value = false;
  }

  Future<void> toggleTodoCompletion(String id, bool completed) async {
    isLoading.value = true;
    try {
      final updatedTodo = await toggleTodo(id, completed);
      final index = todos.indexWhere((todo) => todo.id == id);
      if (index != -1) {
        todos[index] = updatedTodo;
      } else {
        todos.add(updatedTodo);
      }
      Get.snackbar('Success', 'Todo status updated successfully');
    } catch (e) {
      // Error already shown in TodoApiService via Get.snackbar
    }
    isLoading.value = false;
  }

  Future<void> deleteExistingTodo(String id) async {
    isLoading.value = true;
    try {
      await deleteTodo(id);
      todos.removeWhere((todo) => todo.id == id);
      Get.snackbar('Success', 'Todo deleted successfully');
    } catch (e) {
      // Error already shown in TodoApiService via Get.snackbar
    }
    isLoading.value = false;
  }
}