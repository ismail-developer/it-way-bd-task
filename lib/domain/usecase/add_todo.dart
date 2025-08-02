import 'package:it_way_bd_task/domain/entities/todo_entity.dart';
import 'package:it_way_bd_task/domain/repo/todo_repo.dart';
class AddTodo {
  final TodoRepository repository;

  AddTodo(this.repository);

  Future<TodoEntity> call(String title) async {
    return await repository.addTodo(title);
  }
}