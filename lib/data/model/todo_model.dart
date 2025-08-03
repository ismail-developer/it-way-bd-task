import 'package:it_way_bd_task/domain/entities/todo_entity.dart';
class TodoModel extends TodoEntity {
  TodoModel({
    super.id,
    required super.title,
    required super.status,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      title: json['title'],
      status: json['status'] ?? 'pending',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
     'status': status,
    };
  }

  factory TodoModel.fromEntity(TodoEntity entity) {
    return TodoModel(
      id: entity.id,
      title: entity.title,
      status: entity.status,
    );
  }
}