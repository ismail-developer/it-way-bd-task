import 'package:it_way_bd_task/core/utils/app_logger.dart';
import 'package:it_way_bd_task/data/data_source/todo_api_service.dart';
import 'package:it_way_bd_task/data/model/todo_model.dart';
import 'package:it_way_bd_task/domain/entities/todo_entity.dart';
import 'package:it_way_bd_task/domain/repo/todo_repo.dart';
/* class TodoRepositoryImpl implements TodoRepository {
  final TodoApiService apiService;

  TodoRepositoryImpl({required this.apiService});

  @override
  Future<List<TodoEntity>> fetchAllTodos() async {
    try {
      return await apiService.fetchAllTodos();
    } catch (e) {
      AppLogger.error('Repository: Failed to fetch todos: $e');
      rethrow;
    }
  }

  @override
  Future<TodoEntity> addTodo(String title) async {
    try {
      final todo = TodoModel(title: title, completed: false, userId: 5);
      return await apiService.addTodo(todo);
    } catch (e) {
      AppLogger.error('Repository: Failed to add todo: $e');
      rethrow;
    }
  }

  @override
  Future<TodoEntity> updateTodo(int id, String title) async {
    try {
      final todo = TodoModel(id: id, title: title, completed: false, userId: 5);
      return await apiService.updateTodo(id, todo);
    } catch (e) {
      AppLogger.error('Repository: Failed to update todo: $e');
      rethrow;
    }
  }

  @override
  Future<TodoEntity> toggleTodo(int id, bool completed) async {
    try {
      final todo = TodoModel(id: id, title: '', completed: !completed, userId: 5);
      return await apiService.updateTodo(id, todo);
    } catch (e) {
      AppLogger.error('Repository: Failed to toggle todo: $e');
      rethrow;
    }
  }

  @override
  Future<void> deleteTodo(int? id) async {
    try {
      if (id == null) {
        AppLogger.error('Repository: Todo ID is missing');
        throw Exception('Todo ID is missing');
      }
      await apiService.deleteTodo(id);
    } catch (e) {
      AppLogger.error('Repository: Failed to delete todo: $e');
      rethrow;
    }
  }
} */


/* class TodoRepositoryImpl implements TodoRepository {
  final TodoApiService apiService;

  TodoRepositoryImpl({required this.apiService});

  @override
  Future<List<TodoEntity>> fetchAllTodos() async {
    try {
      return await apiService.fetchAllTodos();
    } catch (e) {
      AppLogger.error('Repository: Failed to fetch todos: $e');
      rethrow;
    }
  }

  @override
  Future<TodoEntity> addTodo(String title) async {
    try {
      final todo = TodoModel(title: title, completed: false, userId: 5);
      return await apiService.addTodo(todo);
    } catch (e) {
      AppLogger.error('Repository: Failed to add todo: $e');
      rethrow;
    }
  }

  @override
  Future<TodoEntity> updateTodo(int id, String title) async {
    try {
      final todo = TodoModel(id: id, title: title, completed: false, userId: 5);
      return await apiService.updateTodo(id, todo);
    } catch (e) {
      AppLogger.error('Repository: Failed to update todo: $e');
      rethrow;
    }
  }

  @override
  Future<TodoEntity> toggleTodo(int id, bool completed) async {
    try {
      final todo = TodoModel(id: id, title: '', completed: !completed, userId: 5);
      return await apiService.updateTodo(id, todo);
    } catch (e) {
      AppLogger.error('Repository: Failed to toggle todo: $e');
      rethrow;
    }
  }

  @override
  Future<void> deleteTodo(int? id) async {
    try {
      if (id == null) {
        AppLogger.error('Repository: Todo ID is missing');
        throw Exception('Todo ID is missing');
      }
      await apiService.deleteTodo(id);
    } catch (e) {
      AppLogger.error('Repository: Failed to delete todo: $e');
      rethrow;
    }
  }
} */


class TodoRepositoryImpl implements TodoRepository {
  final TodoApiService apiService;

  TodoRepositoryImpl({required this.apiService});

  @override
  Future<List<TodoEntity>> fetchAllTodos() async {
    try {
      return await apiService.fetchAllTodos();
    } catch (e) {
      AppLogger.error('Repository: Failed to fetch todos: $e');
      rethrow;
    }
  }

  @override
  Future<TodoEntity> addTodo(String title) async {
    try {
      final todo = TodoModel(title: title, completed: false);
      return await apiService.addTodo(todo);
    } catch (e) {
      AppLogger.error('Repository: Failed to add todo: $e');
      rethrow;
    }
  }

  @override
  Future<TodoEntity> updateTodo(String id, String title) async {
    try {
      final todo = TodoModel(id: id, title: title, completed: false);
      return await apiService.updateTodo(id, todo);
    } catch (e) {
      AppLogger.error('Repository: Failed to update todo: $e');
      rethrow;
    }
  }

  @override
  Future<TodoEntity> toggleTodo(String id, bool completed) async {
    try {
      final todo = TodoModel(id: id, title: '', completed: !completed);
      return await apiService.updateTodo(id, todo);
    } catch (e) {
      AppLogger.error('Repository: Failed to toggle todo: $e');
      rethrow;
    }
  }

  @override
  Future<void> deleteTodo(String? id) async {
    try {
      if (id == null) {
        AppLogger.error('Repository: Todo ID is missing');
        throw Exception('Todo ID is missing');
      }
      await apiService.deleteTodo(id);
    } catch (e) {
      AppLogger.error('Repository: Failed to delete todo: $e');
      rethrow;
    }
  }
}