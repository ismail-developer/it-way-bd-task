import 'package:it_way_bd_task/domain/repo/todo_repo.dart';
class DeleteTodo {
  final TodoRepository repository;

  DeleteTodo(this.repository);

  Future<void> call(String? id) async {
    await repository.deleteTodo(id);
  }
}