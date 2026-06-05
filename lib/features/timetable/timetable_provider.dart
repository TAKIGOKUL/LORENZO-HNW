import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../core/services/storage_service.dart';
import '../../core/services/notification_service.dart';
import '../../shared/models/period_model.dart';
import '../settings/settings_provider.dart';

final timetableProvider = NotifierProvider<TimetableNotifier, List<Period>>(() {
  return TimetableNotifier();
});

class TimetableNotifier extends Notifier<List<Period>> {
  final _box = Hive.box<String>(StorageService.periodsBox);

  @override
  List<Period> build() {
    final List<Period> loaded = [];
    for (final key in _box.keys) {
      final jsonStr = _box.get(key);
      if (jsonStr != null) {
        loaded.add(Period.fromJson(jsonDecode(jsonStr)));
      }
    }
    return loaded;
  }

  Future<void> addPeriod(Period period) async {
    await _box.put(period.id, jsonEncode(period.toJson()));
    state = [...state, period];
    final settings = ref.read(settingsProvider);
    await NotificationService.rescheduleAllPeriods(state, settings.preClassReminder);
  }

  Future<void> replaceAllPeriods(List<Period> periods) async {
    await _box.clear();
    for (final p in periods) {
      await _box.put(p.id, jsonEncode(p.toJson()));
    }
    state = periods;
    final settings = ref.read(settingsProvider);
    await NotificationService.rescheduleAllPeriods(state, settings.preClassReminder);
  }

  Future<void> deletePeriod(String id) async {
    await _box.delete(id);
    state = state.where((p) => p.id != id).toList();
    final settings = ref.read(settingsProvider);
    await NotificationService.rescheduleAllPeriods(state, settings.preClassReminder);
  }
}
