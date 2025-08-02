import 'package:get/get.dart';
import 'package:it_way_bd_task/core/service/dio_clinet.dart';
import 'package:it_way_bd_task/data/data_source/todo_api_service.dart';
import 'package:it_way_bd_task/data/repo/todo_repo_impl.dart';
import 'package:it_way_bd_task/domain/usecase/add_todo.dart';
import 'package:it_way_bd_task/domain/usecase/delete_todo.dart';
import 'package:it_way_bd_task/domain/usecase/get_todo.dart';
import 'package:it_way_bd_task/domain/usecase/toggle._todo.dart';
import 'package:it_way_bd_task/domain/usecase/update_todo.dart';
import 'package:it_way_bd_task/presentation/controller/todo_controller.dart';

class TodoBinding extends Bindings {
  @override
  void dependencies() {
    // Register DioClient singleton
    Get.lazyPut(() => DioClient(), fenix: true);
    // Register TodoApiService, dependent on DioClient
    Get.lazyPut(() => TodoApiService(Get.find<DioClient>()), fenix: true);
    // Register TodoRepositoryImpl, dependent on TodoApiService
    Get.lazyPut<TodoRepositoryImpl>(() => TodoRepositoryImpl(apiService: Get.find<TodoApiService>()), fenix: true);
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