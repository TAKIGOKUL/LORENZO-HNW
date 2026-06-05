// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LorenzoTask _$LorenzoTaskFromJson(Map<String, dynamic> json) => _LorenzoTask(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String?,
  priority: $enumDecode(_$TaskPriorityEnumMap, json['priority']),
  dueDate: DateTime.parse(json['dueDate'] as String),
  isCompleted: json['isCompleted'] as bool? ?? false,
  type: $enumDecode(_$TaskTypeEnumMap, json['type']),
  schoolId: json['schoolId'] as String?,
  remindDaysBefore: (json['remindDaysBefore'] as num?)?.toInt() ?? 2,
);

Map<String, dynamic> _$LorenzoTaskToJson(_LorenzoTask instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'priority': _$TaskPriorityEnumMap[instance.priority]!,
      'dueDate': instance.dueDate.toIso8601String(),
      'isCompleted': instance.isCompleted,
      'type': _$TaskTypeEnumMap[instance.type]!,
      'schoolId': instance.schoolId,
      'remindDaysBefore': instance.remindDaysBefore,
    };

const _$TaskPriorityEnumMap = {
  TaskPriority.critical: 'critical',
  TaskPriority.medium: 'medium',
  TaskPriority.low: 'low',
};

const _$TaskTypeEnumMap = {
  TaskType.reminder: 'reminder',
  TaskType.deadline: 'deadline',
  TaskType.schoolEvent: 'schoolEvent',
  TaskType.studentPromise: 'studentPromise',
};
