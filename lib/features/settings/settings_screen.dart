import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_colors.dart';
import '../auth/auth_provider.dart';
import '../../shared/models/user_model.dart';
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
    final user = ref.watch(authProvider) ?? LorenzoUser.initial();

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
            _settingsTile(
              Icons.person_rounded,
              user.name,
              user.email.isEmpty ? 'Tap to set email & code' : '${user.email} • ${user.employeeCode}',
              AppColors.primary,
              onTap: () => _showEditProfileSheet(context, user),
            ),
            const SizedBox(height: 20),

            _sectionLabel('Schools & Schedule'),
            _settingsTile(
              Icons.school_rounded,
              'Configure Schools',
              '${user.schoolNames['schoolA']} · ${user.schoolNames['schoolB']} · ${user.schoolNames['schoolC']}',
              AppColors.teal,
              onTap: () => _showConfigureSchoolsSheet(context, user),
            ),
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
              decoration: AppColors.neumorphicRaised(radius: 16),
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

  // ── Edit Profile Sheet ──────────────────────────────────────────────────────
  void _showEditProfileSheet(BuildContext context, LorenzoUser user) {
    final nameCtrl = TextEditingController(text: user.name);
    final emailCtrl = TextEditingController(text: user.email);
    final codeCtrl = TextEditingController(text: user.employeeCode);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _SheetContainer(
        title: 'Edit Profile',
        child: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _SheetField(controller: nameCtrl, label: 'Display Name', icon: Icons.person_rounded),
              const SizedBox(height: 14),
              _SheetField(controller: emailCtrl, label: 'Email', icon: Icons.email_rounded, keyboard: TextInputType.emailAddress),
              const SizedBox(height: 14),
              _SheetField(controller: codeCtrl, label: 'Employee Code', icon: Icons.badge_rounded),
              const SizedBox(height: 24),
              _SheetSaveButton(onTap: () async {
                final updated = user.copyWith(
                  name: nameCtrl.text.trim(),
                  email: emailCtrl.text.trim(),
                  employeeCode: codeCtrl.text.trim(),
                );
                await ref.read(authProvider.notifier).saveUser(updated);
                if (context.mounted) Navigator.pop(context);
              }),
            ],
          ),
        ),
      ),
    );
  }

  // ── Configure Schools Sheet ─────────────────────────────────────────────────
  void _showConfigureSchoolsSheet(BuildContext context, LorenzoUser user) {
    final aCtrl = TextEditingController(text: user.schoolNames['schoolA']);
    final bCtrl = TextEditingController(text: user.schoolNames['schoolB']);
    final cCtrl = TextEditingController(text: user.schoolNames['schoolC']);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _SheetContainer(
        title: 'Configure Schools',
        child: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _SheetField(controller: aCtrl, label: 'School A', icon: Icons.school_rounded),
              const SizedBox(height: 14),
              _SheetField(controller: bCtrl, label: 'School B', icon: Icons.school_rounded),
              const SizedBox(height: 14),
              _SheetField(controller: cCtrl, label: 'School C', icon: Icons.school_rounded),
              const SizedBox(height: 24),
              _SheetSaveButton(onTap: () async {
                final updated = user.copyWith(
                  schoolNames: {
                    'schoolA': aCtrl.text.trim(),
                    'schoolB': bCtrl.text.trim(),
                    'schoolC': cCtrl.text.trim(),
                  },
                );
                await ref.read(authProvider.notifier).saveUser(updated);
                if (context.mounted) Navigator.pop(context);
              }),
            ],
          ),
        ),
      ),
    );
  }

  // ── Shared Helpers ──────────────────────────────────────────────────────────
  Widget _sectionLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(text, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13, fontWeight: FontWeight.w700, letterSpacing: 0.5)),
    );
  }

  Widget _settingsTile(IconData icon, String title, String subtitle, Color color,
      {bool showWarning = false, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: AppColors.neumorphicRaised(radius: 16),
        child: Row(
          children: [
            Container(
              width: 44, height: 44,
              decoration: BoxDecoration(color: color.withAlpha(35), borderRadius: BorderRadius.circular(12)),
              child: Icon(icon, color: color, size: 22),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(title,
                            style: const TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w700, fontSize: 14),
                            overflow: TextOverflow.ellipsis),
                      ),
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
                  Text(subtitle,
                      style: const TextStyle(color: AppColors.textSecondary, fontSize: 11, fontWeight: FontWeight.w600),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            if (onTap != null)
              Container(
                width: 32, height: 32,
                decoration: AppColors.neumorphicPressed(radius: 10),
                child: Icon(Icons.chevron_right_rounded, color: color.withAlpha(120), size: 18),
              ),
          ],
        ),
      ),
    );
  }

  Widget _switchTile(String title, bool value, ValueChanged<bool> onChanged, Color accentColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: AppColors.neumorphicRaised(radius: 16),
      child: Row(
        children: [
          Expanded(child: Text(title, style: const TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w600, fontSize: 14))),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: accentColor,
            activeTrackColor: accentColor.withAlpha(60),
            inactiveThumbColor: AppColors.textTertiary,
            inactiveTrackColor: AppColors.borderSubtle,
          ),
        ],
      ),
    );
  }
}

// ── Shared Sheet Widgets ──────────────────────────────────────────────────────
class _SheetContainer extends StatelessWidget {
  final String title;
  final Widget child;
  const _SheetContainer({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.borderSubtle, width: 1),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 36, height: 4,
              decoration: BoxDecoration(color: AppColors.borderActive, borderRadius: BorderRadius.circular(2)),
            ),
          ),
          const SizedBox(height: 16),
          Text(title, style: const TextStyle(color: AppColors.textPrimary, fontSize: 17, fontWeight: FontWeight.w800)),
          const SizedBox(height: 20),
          child,
        ],
      ),
    );
  }
}

class _SheetField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final TextInputType keyboard;
  const _SheetField({required this.controller, required this.label, required this.icon, this.keyboard = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboard,
      style: const TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w600),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: AppColors.primary, size: 20),
      ),
    );
  }
}

class _SheetSaveButton extends StatelessWidget {
  final VoidCallback onTap;
  const _SheetSaveButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [AppColors.primary, AppColors.purple]),
            borderRadius: BorderRadius.circular(14),
            boxShadow: [BoxShadow(color: AppColors.primary.withAlpha(60), blurRadius: 12, offset: const Offset(0, 4))],
          ),
          child: const Center(
            child: Text('Save Changes', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 15)),
          ),
        ),
      ),
    );
  }
}
