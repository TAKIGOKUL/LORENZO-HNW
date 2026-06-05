import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../core/services/storage_service.dart';
import '../../core/services/notification_service.dart';
import '../timetable/timetable_provider.dart';

class SettingsState {
  final bool dailyPlanReminder;
  final bool preClassReminder;
  final bool wrapUpAlert;

  const SettingsState({
    required this.dailyPlanReminder,
    required this.preClassReminder,
    required this.wrapUpAlert,
  });

  SettingsState copyWith({
    bool? dailyPlanReminder,
    bool? preClassReminder,
    bool? wrapUpAlert,
  }) {
    return SettingsState(
      dailyPlanReminder: dailyPlanReminder ?? this.dailyPlanReminder,
      preClassReminder: preClassReminder ?? this.preClassReminder,
      wrapUpAlert: wrapUpAlert ?? this.wrapUpAlert,
    );
  }
}

final settingsProvider = NotifierProvider<SettingsNotifier, SettingsState>(() {
  return SettingsNotifier();
});

class SettingsNotifier extends Notifier<SettingsState> {
  final _box = Hive.box<String>(StorageService.userBox);

  @override
  SettingsState build() {
    final daily = _box.get('dailyPlanReminder') == 'true';
    final preClass = _box.get('preClassReminder') == 'true';
    final wrapUp = _box.get('wrapUpAlert') == 'true';
    
    return SettingsState(
      dailyPlanReminder: _box.containsKey('dailyPlanReminder') ? daily : true,
      preClassReminder: _box.containsKey('preClassReminder') ? preClass : true,
      wrapUpAlert: _box.containsKey('wrapUpAlert') ? wrapUp : true,
    );
  }

  Future<void> setDailyPlanReminder(bool value) async {
    await _box.put('dailyPlanReminder', value.toString());
    state = state.copyWith(dailyPlanReminder: value);
    await NotificationService.scheduleDailyPlanReminder(value);
  }

  Future<void> setPreClassReminder(bool value) async {
    await _box.put('preClassReminder', value.toString());
    state = state.copyWith(preClassReminder: value);
    final periods = ref.read(timetableProvider);
    await NotificationService.rescheduleAllPeriods(periods, value);
  }

  Future<void> setWrapUpAlert(bool value) async {
    await _box.put('wrapUpAlert', value.toString());
    state = state.copyWith(wrapUpAlert: value);
  }
}
