import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_colors.dart';
import 'settings_provider.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingsProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 16),
            const Text('Settings ⚙️', style: TextStyle(color: AppColors.textPrimary, fontSize: 22, fontWeight: FontWeight.w800)),
            const SizedBox(height: 24),

            _sectionLabel('Profile'),
            _settingsTile(Icons.person_rounded, 'Edit Profile', 'Name, Email, Employee Code', AppColors.primary),
            const SizedBox(height: 20),

            _sectionLabel('Schools & Schedule'),
            _settingsTile(Icons.school_rounded, 'Configure Schools', 'Rename your three schools', AppColors.teal),
            const SizedBox(height: 10),
            _settingsTile(Icons.calendar_month_rounded, 'Weekly Schedule', 'Assign schools to weekdays', AppColors.orange),
            const SizedBox(height: 20),

            _sectionLabel('Integrations'),
            _settingsTile(Icons.chat_bubble_rounded, 'WhatsApp Groups', 'Configure IDs for each school', AppColors.success),
            const SizedBox(height: 10),
            _settingsTile(Icons.cloud_done_rounded, 'Google Account', 'Connect Drive & Docs', AppColors.danger, showWarning: true),
            const SizedBox(height: 20),

            _sectionLabel('Notifications'),
            _switchTile(
              '📋  Daily Plan Reminder',
              settings.dailyPlanReminder,
              (v) => ref.read(settingsProvider.notifier).setDailyPlanReminder(v),
              AppColors.primary,
            ),
            const SizedBox(height: 10),
            _switchTile(
              '🔔  Pre-class Reminder',
              settings.preClassReminder,
              (v) => ref.read(settingsProvider.notifier).setPreClassReminder(v),
              AppColors.teal,
            ),
            const SizedBox(height: 10),
            _switchTile(
              '⏰  Wrap-Up Alert',
              settings.wrapUpAlert,
              (v) => ref.read(settingsProvider.notifier).setWrapUpAlert(v),
              AppColors.orange,
            ),
            const SizedBox(height: 20),

            _sectionLabel('About'),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: AppColors.neumorphicRaised(radius: 20),
              child: Row(
                children: [
                  Container(
                    width: 44, height: 44,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [AppColors.primary, AppColors.purple]),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Center(child: Text('L', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 20))),
                  ),
                  const SizedBox(width: 14),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Lorenzo', style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w800, fontSize: 16)),
                      Text('v1.0.0 • Built for HowNWhy', style: TextStyle(color: AppColors.textSecondary, fontSize: 12, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _sectionLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(text, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13, fontWeight: FontWeight.w700, letterSpacing: 0.5)),
    );
  }

  Widget _settingsTile(IconData icon, String title, String subtitle, Color color, {bool showWarning = false}) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: AppColors.neumorphicRaised(radius: 20),
      child: Row(
        children: [
          Container(
            width: 44, height: 44,
            decoration: BoxDecoration(color: color.withAlpha(35), borderRadius: BorderRadius.circular(14)),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(title, style: const TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w700, fontSize: 14)),
                    if (showWarning) ...[
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(color: AppColors.warning.withAlpha(40), borderRadius: BorderRadius.circular(6)),
                        child: const Text('Setup', style: TextStyle(color: AppColors.orange, fontSize: 9, fontWeight: FontWeight.w800)),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 2),
                Text(subtitle, style: const TextStyle(color: AppColors.textSecondary, fontSize: 11, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          Container(
            width: 32, height: 32,
            decoration: AppColors.neumorphicPressed(radius: 10),
            child: Icon(Icons.chevron_right_rounded, color: color.withAlpha(120), size: 18),
          ),
        ],
      ),
    );
  }

  Widget _switchTile(String title, bool value, ValueChanged<bool> onChanged, Color accentColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: AppColors.neumorphicRaised(radius: 20),
      child: Row(
        children: [
          Expanded(child: Text(title, style: const TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w600, fontSize: 14))),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: accentColor,
            activeTrackColor: accentColor.withAlpha(60),
            inactiveThumbColor: AppColors.textTertiary,
            inactiveTrackColor: AppColors.borderSubtle,
          ),
        ],
      ),
    );
  }
}
