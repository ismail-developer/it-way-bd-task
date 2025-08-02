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