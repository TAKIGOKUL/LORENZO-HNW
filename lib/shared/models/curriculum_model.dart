import 'package:freezed_annotation/freezed_annotation.dart';

part 'curriculum_model.freezed.dart';
part 'curriculum_model.g.dart';

enum ProjectStatus { toLearn, inProgress, mastered }

@freezed
abstract class CurriculumProject with _$CurriculumProject {
  const CurriculumProject._();
  const factory CurriculumProject({
    required String id,
    required String grade,
    required String chapterName,
    required int chapterNumber,
    required String projectTitle,
    @Default(ProjectStatus.toLearn) ProjectStatus status,
    String? notes,
    DateTime? targetCompletionDate,
  }) = _CurriculumProject;

  factory CurriculumProject.fromJson(Map<String, dynamic> json) => _$CurriculumProjectFromJson(json);
}
