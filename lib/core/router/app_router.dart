import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/dashboard/dashboard_screen.dart';
import '../../features/projects/projects_screen.dart';
import '../../features/settings/settings_screen.dart';
import '../../features/daily_plan/daily_plan_screen.dart';
import '../../features/daily_plan/next_day_plan_screen.dart';
import '../../features/wrap_up/wrap_up_overlay_screen.dart';
import '../../features/voice_widget/voice_debrief_screen.dart';
import '../../shared/widgets/app_shell.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return AppShell(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => const NoTransitionPage(child: DashboardScreen()),
        ),
        GoRoute(
          path: '/projects',
          pageBuilder: (context, state) => const NoTransitionPage(child: ProjectsScreen()),
        ),
        GoRoute(
          path: '/settings',
          pageBuilder: (context, state) => const NoTransitionPage(child: SettingsScreen()),
        ),
      ],
    ),
    // Full-screen routes (no bottom nav)
    GoRoute(
      path: '/daily-plan',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const DailyPlanScreen(),
    ),
    GoRoute(
      path: '/next-day-plan',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const NextDayPlanScreen(),
    ),
    GoRoute(
      path: '/wrap-up-call',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const WrapUpCallScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
    GoRoute(
      path: '/voice-debrief',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const VoiceDebriefScreen(),
    ),
  ],
);
