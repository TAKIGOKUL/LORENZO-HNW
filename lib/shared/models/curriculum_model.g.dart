// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curriculum_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CurriculumProject _$CurriculumProjectFromJson(Map<String, dynamic> json) =>
    _CurriculumProject(
      id: json['id'] as String,
      grade: json['grade'] as String,
      chapterName: json['chapterName'] as String,
      chapterNumber: (json['chapterNumber'] as num).toInt(),
      projectTitle: json['projectTitle'] as String,
      status:
          $enumDecodeNullable(_$ProjectStatusEnumMap, json['status']) ??
          ProjectStatus.toLearn,
      notes: json['notes'] as String?,
      targetCompletionDate: json['targetCompletionDate'] == null
          ? null
          : DateTime.parse(json['targetCompletionDate'] as String),
    );

Map<String, dynamic> _$CurriculumProjectToJson(_CurriculumProject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'grade': instance.grade,
      'chapterName': instance.chapterName,
      'chapterNumber': instance.chapterNumber,
      'projectTitle': instance.projectTitle,
      'status': _$ProjectStatusEnumMap[instance.status]!,
      'notes': instance.notes,
      'targetCompletionDate': instance.targetCompletionDate?.toIso8601String(),
    };

const _$ProjectStatusEnumMap = {
  ProjectStatus.toLearn: 'toLearn',
  ProjectStatus.inProgress: 'inProgress',
  ProjectStatus.mastered: 'mastered',
};
