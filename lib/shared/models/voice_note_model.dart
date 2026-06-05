import 'package:freezed_annotation/freezed_annotation.dart';
import 'task_model.dart';

part 'voice_note_model.freezed.dart';
part 'voice_note_model.g.dart';

@freezed
abstract class VoiceNote with _$VoiceNote {
  const VoiceNote._();
  const factory VoiceNote({
    required String id,
    required DateTime timestamp,
    required String audioPath,
    String? transcription,
    @Default([]) List<LorenzoTask> extractedTasks,
    @Default([]) List<String> mentionedNames,
    @Default(false) bool isSynced,
  }) = _VoiceNote;

  factory VoiceNote.fromJson(Map<String, dynamic> json) => _$VoiceNoteFromJson(json);
}
