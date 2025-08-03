import 'package:get/get.dart';
import 'package:it_way_bd_task/data/data_source/todo_api_service.dart';
import 'package:it_way_bd_task/data/repo/todo_repo_impl.dart';
import 'package:it_way_bd_task/domain/usecase/add_todo.dart';
import 'package:it_way_bd_task/domain/usecase/delete_todo.dart';
import 'package:it_way_bd_task/domain/usecase/get_todo.dart';
import 'package:it_way_bd_task/domain/usecase/toggle._todo.dart';
import 'package:it_way_bd_task/domain/usecase/update_todo.dart';
import 'package:it_way_bd_task/presentation/controller/todo_controller.dart';
import 'package:dio/dio.dart';


class TodoBinding extends Bindings {
  @override
  void dependencies() {
    // Register Dio singleton with configuration
    Get.lazyPut<Dio>(
      () => Dio(
        BaseOptions(
          baseUrl: 'https://688e8382f21ab1769f86f27c.mockapi.io',
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
      ),
      fenix: true,
    );
    // Register TodoApiService, dependent on Dio
    Get.lazyPut(() => TodoApiService(dio: Get.find<Dio>()), fenix: true);
    // Register TodoRepositoryImpl, dependent on TodoApiService
    Get.lazyPut<TodoRepositoryImpl>(
      () => TodoRepositoryImpl(apiService: Get.find<TodoApiService>()),
      fenix: true,
    );
    // Register use cases, dependent on TodoRepositoryImpl
    Get.lazyPut(() => GetTodos(Get.find<TodoRepositoryImpl>()), fenix: true);
    Get.lazyPut(() => AddTodo(Get.find<TodoRepositoryImpl>()), fenix: true);
    Get.lazyPut(() => UpdateTodo(Get.find<TodoRepositoryImpl>()), fenix: true);
    Get.lazyPut(() => ToggleTodo(Get.find<TodoRepositoryImpl>()), fenix: true);
    Get.lazyPut(() => DeleteTodo(Get.find<TodoRepositoryImpl>()), fenix: true);
    // Register TodoController, dependent on all use cases
    Get.lazyPut(
      () => TodoController(
        Get.find<GetTodos>(),
        Get.find<AddTodo>(),
        Get.find<UpdateTodo>(),
        Get.find<ToggleTodo>(),
        Get.find<DeleteTodo>(),
      ),
      fenix: true,
    );
  }
}