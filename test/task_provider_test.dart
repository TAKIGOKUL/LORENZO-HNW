import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lorenzo/core/services/storage_service.dart';
import 'package:lorenzo/features/tasks/task_provider.dart';
import 'package:lorenzo/shared/models/task_model.dart';
import 'dart:io';

void main() {
  late TaskNotifier taskNotifier;
  
  setUp(() async {
    final tempDir = await Directory.systemTemp.createTemp();
    Hive.init(tempDir.path);
    await Hive.openBox<String>(StorageService.tasksBox);
    taskNotifier = TaskNotifier();
  });

  tearDown(() async {
    await Hive.close();
  });

  test('addTask adds a new task to state and storage', () async {
    final task = LorenzoTask(
      id: 'task1',
      title: 'Test Task',
      priority: TaskPriority.critical,
      dueDate: DateTime.now(),
      type: TaskType.schoolEvent,
    );

    await taskNotifier.addTask(task);

    expect(taskNotifier.state.length, 1);
    expect(taskNotifier.state.first.id, 'task1');

    final box = Hive.box<String>(StorageService.tasksBox);
    expect(box.containsKey('task1'), true);
    final storedTask = LorenzoTask.fromJson(jsonDecode(box.get('task1')!));
    expect(storedTask.title, 'Test Task');
  });

  test('updateTask modifies existing task', () async {
    final task = LorenzoTask(
      id: 'task1',
      title: 'Initial Title',
      priority: TaskPriority.low,
      dueDate: DateTime.now(),
      type: TaskType.reminder,
    );

    await taskNotifier.addTask(task);
    
    final updatedTask = task.copyWith(title: 'Updated Title');
    await taskNotifier.updateTask(updatedTask);

    expect(taskNotifier.state.first.title, 'Updated Title');
  });

  test('deleteTask removes task', () async {
    final task = LorenzoTask(
      id: 'task1',
      title: 'To Be Deleted',
      priority: TaskPriority.low,
      dueDate: DateTime.now(),
      type: TaskType.reminder,
    );

    await taskNotifier.addTask(task);
    expect(taskNotifier.state.length, 1);

    await taskNotifier.deleteTask('task1');
    expect(taskNotifier.state.isEmpty, true);
    
    final box = Hive.box<String>(StorageService.tasksBox);
    expect(box.containsKey('task1'), false);
  });
}
