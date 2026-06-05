// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voice_note_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VoiceNote _$VoiceNoteFromJson(Map<String, dynamic> json) => _VoiceNote(
  id: json['id'] as String,
  timestamp: DateTime.parse(json['timestamp'] as String),
  audioPath: json['audioPath'] as String,
  transcription: json['transcription'] as String?,
  extractedTasks:
      (json['extractedTasks'] as List<dynamic>?)
          ?.map((e) => LorenzoTask.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  mentionedNames:
      (json['mentionedNames'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  isSynced: json['isSynced'] as bool? ?? false,
);

Map<String, dynamic> _$VoiceNoteToJson(_VoiceNote instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timestamp': instance.timestamp.toIso8601String(),
      'audioPath': instance.audioPath,
      'transcription': instance.transcription,
      'extractedTasks': instance.extractedTasks,
      'mentionedNames': instance.mentionedNames,
      'isSynced': instance.isSynced,
    };
