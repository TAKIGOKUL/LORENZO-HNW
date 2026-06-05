import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../core/services/storage_service.dart';
import '../../shared/models/task_model.dart';

final taskProvider = NotifierProvider<TaskNotifier, List<LorenzoTask>>(() {
  return TaskNotifier();
});

class TaskNotifier extends Notifier<List<LorenzoTask>> {
  final _box = Hive.box<String>(StorageService.tasksBox);

  @override
  List<LorenzoTask> build() {
    final List<LorenzoTask> loadedTasks = [];
    for (final key in _box.keys) {
      final jsonStr = _box.get(key);
      if (jsonStr != null) {
        loadedTasks.add(LorenzoTask.fromJson(jsonDecode(jsonStr)));
      }
    }
    return loadedTasks;
  }

  Future<void> addTask(LorenzoTask task) async {
    await _box.put(task.id, jsonEncode(task.toJson()));
    state = [...state, task];
  }

  Future<void> updateTask(LorenzoTask task) async {
    await _box.put(task.id, jsonEncode(task.toJson()));
    state = [
      for (final t in state)
        if (t.id == task.id) task else t
    ];
  }

  Future<void> deleteTask(String id) async {
    await _box.delete(id);
    state = state.where((t) => t.id != id).toList();
  }
}
