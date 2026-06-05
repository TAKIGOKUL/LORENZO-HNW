import 'package:hive_flutter/hive_flutter.dart';

class StorageService {
  static const String userBox = 'userBox';
  static const String tasksBox = 'tasksBox';
  static const String periodsBox = 'periodsBox';
  static const String curriculumBox = 'curriculumBox';
  static const String voiceNotesBox = 'voiceNotesBox';

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<String>(userBox);
    await Hive.openBox<String>(tasksBox);
    await Hive.openBox<String>(periodsBox);
    await Hive.openBox<String>(curriculumBox);
    await Hive.openBox<String>(voiceNotesBox);
  }
}
