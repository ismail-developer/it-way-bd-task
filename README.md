# it_way_bd_task


### Todo App

A simple, modern Todo application built with Flutter using Clean Architecture. The app allows users to manage tasks with statuses (Pending, In Progress, Completed), featuring a clean UI, local state updates, and integration with a MockAPI backend.
Features

Task Management: Add, edit, delete, and toggle task statuses (Pending, In Progress, Completed).
Status Display: Each task shows its status with an icon (left) and text (right) for clarity.
Local UI Updates: Immediate UI updates for add, edit, delete, and status toggle without unnecessary API calls.
Pull-to-Refresh: Refresh the task list from the backend.
Custom Snackbar: Error and success messages with consistent styling.
Material 3 Design: Teal-green theme with rounded containers and a Floating Action Button (FAB).
MockAPI Integration: Persistent storage using MockAPI (https://688e8382f21ab1769f86f27c.mockapi.io/TodoApp).
Clean Architecture: Separates concerns into presentation, domain, and data layers for maintainability.
Statemanagement: Used Getx for statemanagement 
Screenshots

<img width="250" height="444" alt="Screenshot_20250803-072509" src="https://github.com/user-attachments/assets/812b5996-bfb0-4a2f-876d-e21b09c94dd5" />
<img width="250" height="444" alt="Screenshot_20250803-072536" src="https://github.com/user-attachments/assets/8abd2b27-74df-4de7-a791-3b2da2d79fed" />
<img width="250" height="444" alt="Screenshot_20250803-072547" src="https://github.com/user-attachments/assets/11565ba5-c7b9-4052-bcea-63735b6ac502" />
<img width="250" height="444" alt="Screenshot_20250803-072638" src="https://github.com/user-attachments/assets/d5e3f305-d4bf-4df1-9365-803bc93ac3a4" />
<img width="250" height="444" alt="Screenshot_20250803-072646" src="https://github.com/user-attachments/assets/1d21f166-5848-4572-bddd-8b4962015c60" />
<img width="250" height="444" alt="Screenshot_20250803-072709" src="https://github.com/user-attachments/assets/c08e74b0-32c8-4bff-b00f-a1cdc3713083" />
<img width="250" height="444" alt="Screenshot_20250803-072713" src="https://github.com/user-attachments/assets/a244d8dc-8edf-4df2-8020-a1d1f9c29826" />
<img width="250" height="444" alt="Screenshot_20250803-072726" src="https://github.com/user-attachments/assets/292d7568-617c-41e9-9c88-122146e15225" />
<img width="250" height="444" alt="Screenshot_20250803-072827" src="https://github.com/user-attachments/assets/1dba2aa9-8b40-40b8-a0e1-93fda518d16a" />

Task List
Add Task
Edit Task
Status Toggle
Error Snackbar


Displays tasks with status icons and text
Add a new task via dialog
Edit task title via dialog
Toggle status (Pending → In Progress → Completed)
Custom snackbar for errors


Note: Replace screenshots/*.png with the actual paths to your uploaded screenshots in the repository.
Architecture
The app follows Clean Architecture to ensure scalability and maintainability:

Presentation Layer: TodoScreen (UI with ListView, RefreshIndicator, FAB, dialogs), TodoController (business logic with GetX).
Domain Layer: TodoEntity (data model), TodoRepository (abstract interface), use cases (GetTodos, AddTodo, UpdateTodo, ToggleTodo, DeleteTodo).
Data Layer: TodoModel (JSON serialization), TodoApiService (API calls with Dio), TodoRepositoryImpl (repository implementation).
Dependency Injection: Managed by TodoBinding using GetX (fenix: true for singletons).

Tech Stack

Flutter: UI framework (Dart).
GetX: State management, dependency injection, and navigation.
Dio: HTTP client for API requests.
Logger: Debugging logs.
MockAPI: Backend for task storage (https://688e8382f21ab1769f86f27c.mockapi.io/TodoApp).
Material 3: Modern design with a teal-green theme (ColorScheme.fromSeed(seedColor: 0xFF2EA877)).

API Schema
The MockAPI resource TodoApp uses the following schema:

id (string, Object ID)
title (string)
status (string: pending, in_progress, completed)

Endpoints:

GET /TodoApp: Fetch all todos
POST /TodoApp: Add a todo
PUT /TodoApp/:id: Update a todo
DELETE /TodoApp/:id: Delete a todo

Setup Instructions

Clone the Repository:
git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name


Install Dependencies:Ensure pubspec.yaml includes:
dependencies:
  flutter:
    sdk: flutter
  dio: ^5.7.0
  get: ^4.6.6
  logger: ^2.4.0

Run:
flutter pub get


Configure MockAPI:

Use project 688e8382f21ab1769f86f27c at mockapi.io.
Ensure the TodoApp resource has the schema: id (string), title (string), status (string).
Test the endpoint:curl https://688e8382f21ab1769f86f27c.mockapi.io/TodoApp




Run the App:
flutter clean
flutter pub get
flutter run



File Structure
lib/
├── core/
│   ├── service/
│   │   ├── api_endpoints.dart
│   │   └── dio_client.dart
│   └── utils/
│       ├── app_colors.dart
│       ├── app_logger.dart
│       └── custom_snackbar.dart
├── data/
│   ├── data_sources/
│   │   └── todo_api_service.dart
│   ├── models/
│   │   └── todo_model.dart
│   └── repositories/
│       └── todo_repository_impl.dart
├── domain/
│   ├── entities/
│   │   └── todo_entity.dart
│   ├── repositories/
│   │   └── todo_repository.dart
│   └── use_cases/
│       ├── add_todo.dart
│       ├── delete_todo.dart
│       ├── get_todos.dart
│       ├── toggle_todo.dart
│       └── update_todo.dart
├── presentation/
│   ├── bindings/
│   │   └── todo_binding.dart
│   ├── controllers/
│   │   └── todo_controller.dart
│   └── screens/
│       └── todo_screen.dart
└── main.dart

Usage

View Tasks: Tasks are listed with status icons (Pending: orange, In Progress: teal, Completed: green) and status text on the right.
Add Task: Tap the FAB to open a dialog and enter a task title (defaults to Pending).
Edit Task: Tap the edit icon to modify the task title.
Toggle Status: Tap a task to cycle through Pending → In Progress → Completed.
Delete Task: Tap the delete icon to remove a task.
Refresh: Pull down to refresh the task list from the API.
Error Handling: Errors (e.g., API failures) trigger a CustomSnackbar with a dark gray background and light text.

Styling

Colors (app_colors.dart):
primary (0xFF2EA877): Teal-green for Scaffold, AppBar, edit icon, In Progress icon.
appBarForeground (0xFFFFFFFF): White for AppBar text/icons.
error (0xFFB00020): Red for delete icon.
snackbarBackground (0xFF313033): Dark gray for snackbar.
snackbarText (0xFFE6E1E5): Light gray for snackbar text/icon.
grey (0xFF808080): Grey for completed task titles.
black (0xFF000000): Black for non-completed titles and status text.
orange (0xFFFFA500): Orange for Pending icon.
green (0xFF008000): Green for Completed icon.


UI Elements:
Rounded container (BorderRadius: 30.0) for the task list.
Standard sizes: fontSize: 16.0 (titles), fontSize: 12.0 (status text), iconSize: 24.0, visualDensity: compact.


License
This project is licensed under the MIT License - see the LICENSE file for details.
