class ApiEndPoints {
  static const String baseUrl = 'https://688e8382f21ab1769f86f27c.mockapi.io';
  static const String fetchTodo = '$baseUrl/TodoApp';
  static String addNewTodo = '$baseUrl/TodoApp';
  static String updateTodo(String id) => '$baseUrl/TodoApp/$id';
  static String deleteTodo(String id) => '$baseUrl/TodoApp/$id';
}