import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_way_bd_task/core/utils/app_colors.dart';
import 'package:it_way_bd_task/presentation/controller/todo_controller.dart';
class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoController controller = Get.find();

    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        title: const Text('Todo List'),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.appBarForeground,
      ),
      body: RefreshIndicator(
        onRefresh: controller.fetchTodos,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: Obx(
            () => controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : controller.todos.isEmpty
                    ? const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.0),
                          child: Text(
                            'No tasks available. Tap the + button to add one.',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.only(top: 20.0),
                        itemCount: controller.todos.length,
                        itemBuilder: (context, index) {
                          final todo = controller.todos[index];
                          return ListTile(
                            leading: _buildStatusIcon(todo.status),
                            title: Text(
                              todo.title.isEmpty ? 'Untitled Task' : todo.title,
                              style: TextStyle(
                                color: todo.status == 'completed' ? AppColors.grey : AppColors.black,
                                decoration: todo.status == 'completed'
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                                fontSize: 16.0,
                              ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  _formatStatus(todo.status),
                                  style: const TextStyle(
                                    color: AppColors.black,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(width: 8.0),
                                IconButton(
                                  icon: const Icon(
                                    Icons.edit,
                                    color: AppColors.primary,
                                  ),
                                  iconSize: 24.0,
                                  visualDensity: VisualDensity.compact,
                                  onPressed: () {
                                    controller.taskTextEditingController.text = todo.title;
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: const Text('Edit Task'),
                                        content: TextField(
                                          controller: controller.taskTextEditingController,
                                          decoration: const InputDecoration(
                                            labelText: 'Task Title',
                                          ),
                                          maxLines: 2,
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(context),
                                            child: const Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              if (controller.taskTextEditingController.text.isNotEmpty) {
                                                controller.updateExistingTodo(
                                                  todo.id!,
                                                  controller.taskTextEditingController.text,
                                                );
                                                Navigator.pop(context);
                                              }
                                            },
                                            child: const Text('Update'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: AppColors.error,
                                  ),
                                  iconSize: 24.0,
                                  visualDensity: VisualDensity.compact,
                                  onPressed: () => controller.deleteExistingTodo(todo.id!),
                                ),
                              ],
                            ),
                            onTap: () {
                              controller.toggleTodoStatus(todo.id!, todo.status);
                            },
                          );
                        },
                      ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.taskTextEditingController.clear();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Add Task'),
              content: TextField(
                controller: controller.taskTextEditingController,
                decoration: const InputDecoration(
                  labelText: 'Describe your task',
                ),
                maxLines: 2,
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    if (controller.taskTextEditingController.text.isNotEmpty) {
                      controller.addNewTodo(controller.taskTextEditingController.text);
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildStatusIcon(String status) {
    switch (status) {
      case 'pending':
        return const Icon(Icons.pending, color: AppColors.orange, size: 24.0);
      case 'in_progress':
        return const Icon(Icons.hourglass_empty, color: AppColors.primary, size: 24.0);
      case 'completed':
        return const Icon(Icons.check_circle, color: AppColors.green, size: 24.0);
      default:
        return const Icon(Icons.pending, color: AppColors.orange, size: 24.0);
    }
  }

  String _formatStatus(String status) {
    switch (status) {
      case 'pending':
        return 'Pending';
      case 'in_progress':
        return 'In Progress';
      case 'completed':
        return 'Completed';
      default:
        return 'Pending';
    }
  }
}