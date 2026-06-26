// To run this file: dart run todo.dart

// =====================================================================
// A simple todo list using user input
// =====================================================================
import 'dart:io';

void main() {
  print("=== Dart CLI Todo List ===");

  final tasks = <String>[];

  while (true) {
    print("\n==== Choose an option: ====");
    print("1. Enter a task");
    print("2. View tasks");
    print("3. Delete a task");
    print("4. Update a task");
    print("5. Delete all tasks");
    print("6. Exit");

    stdout.write("Your choice: ");
    final input = stdin.readLineSync()?.trim() ?? "";

    switch (input) {
      case "1":
        stdout.write("Enter new task: ");
        final task = stdin.readLineSync()?.trim();
        if (task != null && task.isNotEmpty) {
          tasks.add(task);
          print("Task '$task' added.");
        } else {
          print("Invalid task.");
        }
        break;

      case "2":
        if (tasks.isEmpty) {
          print("No tasks yet!");
        } else {
          print("\nYour tasks:");
          for (int i = 0; i < tasks.length; i++) {
            print("${i + 1}. ${tasks[i]}");
          }
        }
        break;

      case "3":
        stdout.write("Enter task number to delete: ");
        final index = int.tryParse(stdin.readLineSync() ?? "");
        if (index != null && index > 0 && index <= tasks.length) {
          print("Task '${tasks[index - 1]}' deleted.");
          tasks.removeAt(index - 1);
        } else {
          print("Invalid index.");
        }
        break;

      case "4":
        stdout.write("Enter task number to update: ");
        final index = int.tryParse(stdin.readLineSync() ?? "");
        if (index != null && index > 0 && index <= tasks.length) {
          stdout.write("Enter new task text: ");
          final updatedTask = stdin.readLineSync()?.trim();
          if (updatedTask != null && updatedTask.isNotEmpty) {
            tasks[index - 1] = updatedTask;
            print("Task updated to '$updatedTask'.");
          } else {
            print("Invalid task.");
          }
        } else {
          print("Invalid index.");
        }
        break;

      case "5":
        tasks.clear();
        print("All tasks deleted.");
        break;

      case "6":
        print("Goodbye!");
        return;

      default:
        print("Invalid option. Please try again.");
    }
  }
}
