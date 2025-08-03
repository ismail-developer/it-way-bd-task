import 'package:it_way_bd_task/domain/entities/todo_entity.dart';
abstract class TodoRepository {
  Future<List<TodoEntity>> fetchAllTodos();
  Future<TodoEntity> addTodo(String title);
  Future<TodoEntity> updateTodo(String id, String title);
  Future<TodoEntity> toggleTodo(String id, String status);
  Future<void> deleteTodo(String? id);
}