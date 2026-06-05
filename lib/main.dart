import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/services/storage_service.dart';
import 'core/services/notification_service.dart';
import 'core/theme/app_theme.dart';
import 'core/router/app_router.dart';
import 'features/voice_widget/voice_widget.dart';
import 'package:home_widget/home_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await StorageService.init();
  } catch (e) {
    debugPrint('StorageService init error: $e');
  }
  
  try {
    await NotificationService.init();
  } catch (e) {
    debugPrint('NotificationService init error: $e');
  }
  
  try {
    await VoiceWidget.init();
  } catch (e) {
    debugPrint('VoiceWidget init error: $e');
  }

  runApp(
    const ProviderScope(
      child: LorenzoApp(),
    ),
  );
}

class LorenzoApp extends StatefulWidget {
  const LorenzoApp({super.key});

  @override
  State<LorenzoApp> createState() => _LorenzoAppState();
}

class _LorenzoAppState extends State<LorenzoApp> {
  @override
  void initState() {
    super.initState();
    _checkWidgetLaunch();
    HomeWidget.widgetClicked.listen(_handleWidgetClick);
  }

  Future<void> _checkWidgetLaunch() async {
    try {
      final uri = await HomeWidget.initiallyLaunchedFromHomeWidget();
      if (uri != null) _handleWidgetClick(uri);
    } catch (e) {
      debugPrint('Error checking widget launch: $e');
    }
  }

  void _handleWidgetClick(Uri? uri) {
    if (uri?.host == 'voice_widget') {
      appRouter.push('/voice-debrief');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Lorenzo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      routerConfig: appRouter,
    );
  }
}
