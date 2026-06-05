// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'period_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Period _$PeriodFromJson(Map<String, dynamic> json) => _Period(
  id: json['id'] as String,
  schoolId: json['schoolId'] as String,
  weekday: json['weekday'] as String,
  periodNumber: (json['periodNumber'] as num).toInt(),
  startTime: const TimeOfDayConverter().fromJson(json['startTime'] as String),
  endTime: const TimeOfDayConverter().fromJson(json['endTime'] as String),
  grade: json['grade'] as String,
  subject: json['subject'] as String,
);

Map<String, dynamic> _$PeriodToJson(_Period instance) => <String, dynamic>{
  'id': instance.id,
  'schoolId': instance.schoolId,
  'weekday': instance.weekday,
  'periodNumber': instance.periodNumber,
  'startTime': const TimeOfDayConverter().toJson(instance.startTime),
  'endTime': const TimeOfDayConverter().toJson(instance.endTime),
  'grade': instance.grade,
  'subject': instance.subject,
};
