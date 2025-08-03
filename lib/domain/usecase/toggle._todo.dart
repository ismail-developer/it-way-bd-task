import 'package:it_way_bd_task/domain/entities/todo_entity.dart';
import 'package:it_way_bd_task/domain/repo/todo_repo.dart';
class ToggleTodo {
  final TodoRepository repository;

  ToggleTodo(this.repository);

  Future<TodoEntity> call(String id, String status) async {
    return await repository.toggleTodo(id, status);
  }
}