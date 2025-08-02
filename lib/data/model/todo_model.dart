import 'package:it_way_bd_task/domain/entities/todo_entity.dart';

/* class TodoModel extends TodoEntity {
  TodoModel({
    super.id,
    required super.title,
    required super.completed,
    required super.userId,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      title: json['todo'],
      completed: json['completed'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'todo': title,
      'completed': completed,
      'userId': userId,
    };
  }

  factory TodoModel.fromEntity(TodoEntity entity) {
    return TodoModel(
      id: entity.id,
      title: entity.title,
      completed: entity.completed,
      userId: entity.userId,
    );
  }
} */


class TodoModel extends TodoEntity {
  TodoModel({
    super.id,
    required super.title,
    required super.completed,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'completed': completed,
    };
  }

  factory TodoModel.fromEntity(TodoEntity entity) {
    return TodoModel(
      id: entity.id,
      title: entity.title,
      completed: entity.completed,
    );
  }
}