/* class ApiEndPoints {
  ApiEndPoints._();

  /// Subscription related endpoints
  static const String fetchTodo = "/todos";
  static const String addNewTodo = "/todos/add";
  static  String updateTodo(int id) => "/todos/$id";
  static  String deleteTodo(int id) => "/todos/$id";

} */

class ApiEndPoints {
  static const String baseUrl = 'https://688e8382f21ab1769f86f27c.mockapi.io';
  static const String fetchTodo = '$baseUrl/TodoApp';
  static String addNewTodo = '$baseUrl/TodoApp';
  static String updateTodo(String id) => '$baseUrl/TodoApp/$id';
  static String deleteTodo(String id) => '$baseUrl/TodoApp/$id';
}