import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import '../../shared/models/period_model.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static const int _dailyPlanId = 999;
  static const String _dailyChannelId = 'daily_plan_channel';
  static const String _dailyChannelName = 'Daily Plan Reminders';

  static const String _periodChannelId = 'period_reminder_channel';
  static const String _periodChannelName = 'Pre-class Period Reminders';

  static Future<void> init() async {
    tz.initializeTimeZones();
    try {
      tz.setLocalLocation(tz.getLocation('Asia/Kolkata')); // Standard default for India / HowNWhy
    } catch (_) {
      try {
        tz.setLocalLocation(tz.getLocation('UTC'));
      } catch (e) {
        debugPrint('Failed to set local timezone: $e');
      }
    }

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open App');

    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
      macOS: initializationSettingsDarwin,
      linux: initializationSettingsLinux,
    );

    try {
      await _notificationsPlugin.initialize(
        settings: initializationSettings,
        onDidReceiveNotificationResponse: (NotificationResponse details) {
          debugPrint('Notification clicked: ${details.payload}');
        },
      );

      // On Android, request permission
      if (Platform.isAndroid) {
        await _notificationsPlugin
            .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin>()
            ?.requestNotificationsPermission();
      }
    } catch (e) {
      debugPrint('Failed to initialize notifications plugin: $e');
    }
  }

  /// Helper to generate unique integer ID from string ID
  static int _getNotificationId(String uniqueString) {
    return uniqueString.hashCode.abs() % 100000;
  }

  /// Schedule Daily Plan reminder at 6:30 PM (18:30)
  static Future<void> scheduleDailyPlanReminder(bool enabled) async {
    try {
      // First cancel existing daily plan reminder
      await _notificationsPlugin.cancel(id: _dailyPlanId);

      if (!enabled) return;

      final now = tz.TZDateTime.now(tz.local);
      var scheduledDate = tz.TZDateTime(
        tz.local,
        now.year,
        now.month,
        now.day,
        18, // 6 PM
        30, // 30 min
      );

      // If scheduled date is in the past, schedule it for tomorrow
      if (scheduledDate.isBefore(now)) {
        scheduledDate = scheduledDate.add(const Duration(days: 1));
      }

      const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
        _dailyChannelId,
        _dailyChannelName,
        channelDescription: 'Reminder to fill and share your daily plan',
        importance: Importance.max,
        priority: Priority.high,
      );

      const NotificationDetails details = NotificationDetails(
        android: androidDetails,
        iOS: DarwinNotificationDetails(presentAlert: true, presentSound: true),
        linux: LinuxNotificationDetails(),
      );

      await _notificationsPlugin.zonedSchedule(
        id: _dailyPlanId,
        title: 'Daily Plan Reminder 📋',
        body: 'Time to compile and post your Daily Plan update on WhatsApp!',
        scheduledDate: scheduledDate,
        notificationDetails: details,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time,
      );
      debugPrint('Scheduled daily plan notification at $scheduledDate');
    } catch (e) {
      debugPrint('Error scheduling daily plan reminder: $e');
    }
  }

  /// Reschedule reminders for all periods
  /// Scheduled 10 minutes before the period starts
  static Future<void> rescheduleAllPeriods(List<Period> periods, bool preClassEnabled) async {
    try {
      // First, cancel all notifications in the period category range by cancellation or all
      for (final p in periods) {
        final id = _getNotificationId(p.id);
        await _notificationsPlugin.cancel(id: id);
      }

      if (!preClassEnabled) return;

      for (final period in periods) {
        await _schedulePeriodReminder(period);
      }
    } catch (e) {
      debugPrint('Error rescheduling period notifications: $e');
    }
  }

  static int _getWeekdayInt(String dayName) {
    switch (dayName.toLowerCase()) {
      case 'monday':
        return DateTime.monday;
      case 'tuesday':
        return DateTime.tuesday;
      case 'wednesday':
        return DateTime.wednesday;
      case 'thursday':
        return DateTime.thursday;
      case 'friday':
        return DateTime.friday;
      case 'saturday':
        return DateTime.saturday;
      case 'sunday':
        return DateTime.sunday;
      default:
        return DateTime.monday;
    }
  }

  static Future<void> _schedulePeriodReminder(Period period) async {
    try {
      final id = _getNotificationId(period.id);

      // Calculate the time 10 minutes prior
      var hour = period.startTime.hour;
      var minute = period.startTime.minute - 10;
      if (minute < 0) {
        hour = (hour - 1 + 24) % 24;
        minute = 60 + minute;
      }

      final now = tz.TZDateTime.now(tz.local);
      final weekdayTarget = _getWeekdayInt(period.weekday);

      // Find the next occurrence of this weekday with the calculated target time
      var scheduledDate = tz.TZDateTime(
        tz.local,
        now.year,
        now.month,
        now.day,
        hour,
        minute,
      );

      // Adjust to matching weekday
      var daysToAdd = (weekdayTarget - scheduledDate.weekday + 7) % 7;
      if (daysToAdd == 0 && scheduledDate.isBefore(now)) {
        daysToAdd = 7;
      }
      scheduledDate = scheduledDate.add(Duration(days: daysToAdd));

      const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
        _periodChannelId,
        _periodChannelName,
        channelDescription: 'Reminders 10 minutes before class periods start',
        importance: Importance.max,
        priority: Priority.high,
      );

      const NotificationDetails details = NotificationDetails(
        android: androidDetails,
        iOS: DarwinNotificationDetails(presentAlert: true, presentSound: true),
        linux: LinuxNotificationDetails(),
      );

      await _notificationsPlugin.zonedSchedule(
        id: id,
        title: 'Class Starting Soon! 🔔',
        body: 'Your period for ${period.grade} (${period.subject}) starts in 10 minutes.',
        scheduledDate: scheduledDate,
        notificationDetails: details,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
      );
      debugPrint('Scheduled reminder for ${period.grade} on ${period.weekday} at $scheduledDate');
    } catch (e) {
      debugPrint('Error scheduling period reminder for ${period.id}: $e');
    }
  }
}
