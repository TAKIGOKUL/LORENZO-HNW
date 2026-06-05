import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

enum TaskPriority { critical, medium, low }
enum TaskType { reminder, deadline, schoolEvent, studentPromise }

@freezed
abstract class LorenzoTask with _$LorenzoTask {
  const LorenzoTask._();
  const factory LorenzoTask({
    required String id,
    required String title,
    String? description,
    required TaskPriority priority,
    required DateTime dueDate,
    @Default(false) bool isCompleted,
    required TaskType type,
    String? schoolId,
    @Default(2) int remindDaysBefore,
  }) = _LorenzoTask;

  factory LorenzoTask.fromJson(Map<String, dynamic> json) => _$LorenzoTaskFromJson(json);
}
