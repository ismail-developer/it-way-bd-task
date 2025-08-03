import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:it_way_bd_task/core/constant/api_endspoints.dart';
import 'package:it_way_bd_task/core/service/dio_clinet.dart';
import 'package:it_way_bd_task/core/utils/app_logger.dart';
import 'package:it_way_bd_task/core/utils/custom_snackbar.dart';
import 'package:it_way_bd_task/data/model/todo_model.dart';
import 'package:it_way_bd_task/domain/entities/todo_entity.dart';

/* class TodoApiService {
  final DioClient _dioClient;

  TodoApiService(this._dioClient);

  Future<List<TodoEntity>> fetchAllTodos() async {
    AppLogger.debug('TodoApiService: Fetching all todos');
    try {
      final response = await _dioClient.dio.get(ApiEndPoints.fetchTodo);
      if (response.statusCode == 200 && response.data != null) {
        return (response.data as List)
            .map((data) => TodoModel.fromJson(data))
            .toList();
      }
      AppLogger.error('Failed to fetch todos: Invalid response');

      CustomSnackbar.showSnackbar('Failed to fetch todos: Invalid response');
      throw Exception('Failed to fetch todos: Invalid response');
    } catch (e) {
      AppLogger.error('Failed to fetch todos: $e');
      CustomSnackbar.showSnackbar('Failed to fetch todos: $e');
      throw Exception('Failed to fetch todos: $e');
    }
  }

  Future<TodoEntity> addTodo(TodoModel todo) async {
    AppLogger.debug('TodoApiService: Adding todo');
    try {
      final response = await _dioClient.dio.post(
        ApiEndPoints.addNewTodo,
        data: todo.toJson(),
      );
      if ((response.statusCode == 200 || response.statusCode == 201) &&
          response.data != null) {
        return TodoModel.fromJson(response.data);
      }
      AppLogger.error('Failed to add todo: Invalid response');
      CustomSnackbar.showSnackbar('Failed to add todo: Invalid response');
      throw Exception('Failed to add todo: Invalid response');
    } catch (e) {
      AppLogger.error('Failed to add todo: $e');
      CustomSnackbar.showSnackbar('Failed to add todo: $e');
      throw Exception('Failed to add todo: $e');
    }
  }

  Future<TodoEntity> updateTodo(String id, TodoModel todo) async {
    AppLogger.debug('TodoApiService: Updating todo with id $id');
    try {
      final response = await _dioClient.dio.put(
        ApiEndPoints.updateTodo(id),
        data: todo.toJson(),
      );
      if (response.statusCode == 200 && response.data != null) {
        return TodoModel.fromJson(response.data);
      }
      AppLogger.error('Failed to update todo: Invalid response');
      CustomSnackbar.showSnackbar('Failed to update todo: Invalid response');
      throw Exception('Failed to update todo: Invalid response');
    } catch (e) {
      AppLogger.error('Failed to update todo: $e');
      CustomSnackbar.showSnackbar('Failed to update todo: $e');
      throw Exception('Failed to update todo: $e');
    }
  }

  Future<void> deleteTodo(String id) async {
    AppLogger.debug('TodoApiService: Deleting todo with id $id');
    try {
      final response = await _dioClient.dio.delete(ApiEndPoints.deleteTodo(id));
      if (response.statusCode == 200 || response.statusCode == 204) {
        return;
      }
      AppLogger.error('Failed to delete todo: Invalid response');
      CustomSnackbar.showSnackbar('Failed to delete todo: Invalid response');
      throw Exception('Failed to delete todo: Invalid response');
    } catch (e) {
      AppLogger.error('Failed to delete todo: $e');
      CustomSnackbar.showSnackbar('Failed to delete todo: $e');
      throw Exception('Failed to delete todo: $e');
    }
  }
} */


class TodoApiService {
  final Dio dio;

  TodoApiService({required this.dio});

  Future<List<TodoModel>> fetchAllTodos() async {
    AppLogger.debug('TodoApiService: Fetching all todos');
    try {
      final response = await dio.get(ApiEndPoints.fetchTodo);
      if (response.statusCode == 200 && response.data != null) {
        return (response.data as List)
            .map((json) => TodoModel.fromJson(json))
            .toList();
      }
      AppLogger.error('Failed to fetch todos: Invalid response');
      CustomSnackbar.showSnackbar('Failed to fetch todos: Invalid response');
      throw Exception('Failed to fetch todos: Invalid response');
    } catch (e) {
      AppLogger.error('Failed to fetch todos: $e');
      CustomSnackbar.showSnackbar('Failed to fetch todos: $e');
      throw Exception('Failed to fetch todos: $e');
    }
  }

  Future<TodoModel> addTodo(TodoModel todo) async {
    AppLogger.debug('TodoApiService: Adding todo');
    try {
      final response = await dio.post(
        ApiEndPoints.addNewTodo,
        data: todo.toJson(),
      );
      if ((response.statusCode == 200 || response.statusCode == 201) && response.data != null) {
        return TodoModel.fromJson(response.data);
      }
      AppLogger.error('Failed to add todo: Invalid response');
      CustomSnackbar.showSnackbar('Failed to add todo: Invalid response');
      throw Exception('Failed to add todo: Invalid response');
    } catch (e) {
      AppLogger.error('Failed to add todo: $e');
      CustomSnackbar.showSnackbar('Failed to add todo: $e');
      throw Exception('Failed to add todo: $e');
    }
  }

  Future<TodoModel> updateTodo(String id, TodoModel todo) async {
    AppLogger.debug('TodoApiService: Updating todo with id $id');
    try {
      final response = await dio.put(
        ApiEndPoints.updateTodo(id),
        data: todo.toJson(),
      );
      if (response.statusCode == 200 && response.data != null) {
        return TodoModel.fromJson(response.data);
      }
      AppLogger.error('Failed to update todo: Invalid response');
      CustomSnackbar.showSnackbar('Failed to update todo: Invalid response');
      throw Exception('Failed to update todo: Invalid response');
    } catch (e) {
      AppLogger.error('Failed to update todo: $e');
      CustomSnackbar.showSnackbar('Failed to update todo: $e');
      throw Exception('Failed to update todo: $e');
    }
  }

  Future<void> deleteTodo(String id) async {
    AppLogger.debug('TodoApiService: Deleting todo with id $id');
    try {
      final response = await dio.delete(ApiEndPoints.deleteTodo(id));
      if (response.statusCode == 200 || response.statusCode == 204) {
        return;
      }
      AppLogger.error('Failed to delete todo: Invalid response');
      CustomSnackbar.showSnackbar('Failed to delete todo: Invalid response');
      throw Exception('Failed to delete todo: Invalid response');
    } catch (e) {
      AppLogger.error('Failed to delete todo: $e');
      CustomSnackbar.showSnackbar('Failed to delete todo: $e');
      throw Exception('Failed to delete todo: $e');
    }
  }
}