import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_way_bd_task/presentation/controller/todo_controller.dart';
class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoController controller = Get.find();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: const Text('Todo List'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Container(
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
                          leading: Transform.scale(
                            scale: 2.0,
                            child: Checkbox(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              value: todo.completed,
                              onChanged: (value) {
                                controller.toggleTodoCompletion(todo.id!, todo.completed);
                              },
                            ),
                          ),
                          title: Text(
                            todo.title,
                            style: TextStyle(
                              color: todo.completed ? Colors.grey : Colors.black,
                              decoration: todo.completed
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                              fontSize: 20,
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit, color: Colors.blue),
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
                                icon: const Icon(Icons.delete, color: Colors.redAccent),
                                onPressed: () => controller.deleteExistingTodo(todo.id!),
                              ),
                            ],
                          ),
                        );
                      },
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
}