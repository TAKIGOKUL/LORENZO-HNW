import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../core/services/storage_service.dart';
import '../../shared/models/curriculum_model.dart';

final curriculumProvider = NotifierProvider<CurriculumNotifier, List<CurriculumProject>>(() {
  return CurriculumNotifier();
});

class CurriculumNotifier extends Notifier<List<CurriculumProject>> {
  final _box = Hive.box<String>(StorageService.curriculumBox);

  @override
  List<CurriculumProject> build() {
    final List<CurriculumProject> loaded = [];
    if (_box.isEmpty) {
      _seedDefaultCurriculum();
    }
    
    for (final key in _box.keys) {
      final jsonStr = _box.get(key);
      if (jsonStr != null) {
        loaded.add(CurriculumProject.fromJson(jsonDecode(jsonStr)));
      }
    }
    return loaded;
  }

  void _seedDefaultCurriculum() {
    int idCounter = 0;
    String nextId() => DateTime.now().microsecondsSinceEpoch.toString() + (idCounter++).toString();

    final defaults = [
      // Grade 4
      CurriculumProject(id: nextId(), grade: 'Grade 4', chapterName: 'Robotics Basics', chapterNumber: 1, projectTitle: 'LED Blink'),
      CurriculumProject(id: nextId(), grade: 'Grade 4', chapterName: 'Robotics Basics', chapterNumber: 1, projectTitle: 'Motor Control'),
      CurriculumProject(id: nextId(), grade: 'Grade 4', chapterName: 'Automation', chapterNumber: 2, projectTitle: 'Line Follower'),
      
      // Grade 5
      CurriculumProject(id: nextId(), grade: 'Grade 5', chapterName: 'Sensors', chapterNumber: 1, projectTitle: 'IR Sensor Interfacing'),
      CurriculumProject(id: nextId(), grade: 'Grade 5', chapterName: 'Sensors', chapterNumber: 1, projectTitle: 'Ultrasonic Radar'),
      CurriculumProject(id: nextId(), grade: 'Grade 5', chapterName: 'Automation', chapterNumber: 2, projectTitle: 'Obstacle Avoidance'),
      
      // Grade 6
      CurriculumProject(id: nextId(), grade: 'Grade 6', chapterName: 'Logic Gates', chapterNumber: 1, projectTitle: 'AND/OR Gate Circuit'),
      CurriculumProject(id: nextId(), grade: 'Grade 6', chapterName: 'IoT', chapterNumber: 2, projectTitle: 'Smart Home Hub'),
    ];

    for (var p in defaults) {
      _box.put(p.id, jsonEncode(p.toJson()));
    }
  }

  Future<void> addProject(CurriculumProject project) async {
    await _box.put(project.id, jsonEncode(project.toJson()));
    state = [...state, project];
  }

  Future<void> updateProjectStatus(String id, ProjectStatus newStatus) async {
    final project = state.firstWhere((p) => p.id == id);
    final updated = project.copyWith(status: newStatus);
    await _box.put(id, jsonEncode(updated.toJson()));
    state = [
      for (final p in state)
        if (p.id == id) updated else p
    ];
  }
}
