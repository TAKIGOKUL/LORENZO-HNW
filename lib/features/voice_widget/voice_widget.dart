import 'package:flutter/material.dart';
import 'package:home_widget/home_widget.dart';

class VoiceWidget {
  static const String _appGroupId = 'com.example.lorenzo'; // Should match iOS
  static const String _iOSWidgetName = 'VoiceWidget';
  static const String _androidWidgetName = 'VoiceWidgetProvider';

  static Future<void> init() async {
    await HomeWidget.setAppGroupId(_appGroupId);
    
    // Register interop callback
    HomeWidget.registerInteractivityCallback(backgroundCallback);
  }
}

@pragma('vm:entry-point')
Future<void> backgroundCallback(Uri? uri) async {
  if (uri?.host == 'voice_widget') {
    // Bring app to foreground and launch voice debrief
    // In a real implementation we would need to use intents or platform channels
    // to bring the app to foreground, or use flutter_local_notifications full screen intent
  }
}
