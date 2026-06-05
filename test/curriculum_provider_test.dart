import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lorenzo/core/services/storage_service.dart';
import 'package:lorenzo/features/projects/curriculum_provider.dart';
import 'package:lorenzo/shared/models/curriculum_model.dart';
import 'dart:io';

void main() {
  late CurriculumNotifier curriculumNotifier;
  
  setUp(() async {
    final tempDir = await Directory.systemTemp.createTemp();
    Hive.init(tempDir.path);
    await Hive.openBox<String>(StorageService.curriculumBox);
    curriculumNotifier = CurriculumNotifier();
  });

  tearDown(() async {
    await Hive.close();
  });

  test('addProject adds a new project', () async {
    final project = CurriculumProject(
      id: 'proj1',
      grade: 'Grade 4',
      chapterName: 'Robotics Basics',
      chapterNumber: 1,
      projectTitle: 'LED Blink',
    );

    await curriculumNotifier.addProject(project);

    expect(curriculumNotifier.state.length, 1);
    expect(curriculumNotifier.state.first.projectTitle, 'LED Blink');
    expect(curriculumNotifier.state.first.status, ProjectStatus.toLearn);
  });

  test('updateProjectStatus changes the state from toLearn to mastered', () async {
    final project = CurriculumProject(
      id: 'proj1',
      grade: 'Grade 5',
      chapterName: 'Sensors',
      chapterNumber: 2,
      projectTitle: 'Distance Sensor',
    );

    await curriculumNotifier.addProject(project);
    
    await curriculumNotifier.updateProjectStatus('proj1', ProjectStatus.mastered);

    expect(curriculumNotifier.state.first.status, ProjectStatus.mastered);
    
    final box = Hive.box<String>(StorageService.curriculumBox);
    final storedProj = CurriculumProject.fromJson(jsonDecode(box.get('proj1')!));
    expect(storedProj.status, ProjectStatus.mastered);
  });
}
