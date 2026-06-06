import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';

class AppShell extends StatelessWidget {
  final Widget child;
  const AppShell({super.key, required this.child});

  void _onTap(BuildContext context, int index) {
    switch (index) {
      case 0: context.go('/'); break;
      case 1: context.go('/projects'); break;
      case 2: context.push('/wrap-up-call'); break;
      case 3: context.push('/settings'); break;
    }
  }

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/projects')) return 1;
    if (location.startsWith('/settings')) return 4;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final selected = _calculateSelectedIndex(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: child,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: 12, bottom: 20, left: 24, right: 24),
        decoration: const BoxDecoration(
          color: AppColors.background,
          border: Border(top: BorderSide(color: AppColors.borderSubtle)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _NavItem(icon: Icons.home_outlined, label: 'Home', isActive: selected == 0, color: AppColors.primary, onTap: () => _onTap(context, 0)),
            _NavItem(icon: Icons.check_box_outlined, label: 'Projects', isActive: selected == 1, color: AppColors.textSecondary, onTap: () => _onTap(context, 1)),
            GestureDetector(
              onTap: () {}, // Center FAB action
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.surfaceElevated,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.borderSubtle),
                ),
                child: const Icon(Icons.arrow_downward_rounded, color: AppColors.textSecondary, size: 20),
              ),
            ),
            _NavItem(icon: Icons.phone_in_talk_outlined, label: 'Wrap-Up', isActive: selected == 2, color: AppColors.textSecondary, onTap: () => _onTap(context, 2), hasDot: true),
            _NavItem(icon: Icons.settings_outlined, label: 'Settings', isActive: selected == 4, color: AppColors.textSecondary, onTap: () => _onTap(context, 3)),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final Color color;
  final VoidCallback onTap;
  final bool hasDot;

  const _NavItem({required this.icon, required this.label, required this.isActive, required this.color, required this.onTap, this.hasDot = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(icon, color: isActive ? color : AppColors.textSecondary, size: 24),
              if (hasDot)
                Positioned(
                  right: -2,
                  top: -2,
                  child: Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: AppColors.danger,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(color: isActive ? color : AppColors.textSecondary, fontWeight: isActive ? FontWeight.w600 : FontWeight.w500, fontSize: 10)),
        ],
      ),
    );
  }
}
