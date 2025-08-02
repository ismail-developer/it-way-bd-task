import 'package:it_way_bd_task/domain/entities/todo_entity.dart';
import 'package:it_way_bd_task/domain/repo/todo_repo.dart';
class UpdateTodo {
  final TodoRepository repository;

  UpdateTodo(this.repository);

  Future<TodoEntity> call(String id, String title) async {
    return await repository.updateTodo(id, title);
  }
}