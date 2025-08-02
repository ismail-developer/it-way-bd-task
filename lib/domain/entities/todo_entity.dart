/* class TodoEntity {
  final int? id;
  final String title;
  final bool completed;
  final int userId;

  TodoEntity({
    this.id,
    required this.title,
    required this.completed,
    required this.userId,
  });
} */
class TodoEntity {
  final String? id;
  final String title;
  final bool completed;

  TodoEntity({
    this.id,
    required this.title,
    required this.completed,
  });
}