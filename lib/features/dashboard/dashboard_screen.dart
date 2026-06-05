import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../core/theme/app_colors.dart';
import '../auth/auth_provider.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  String _selectedSchool = 'All Schools';
  DateTime _currentMonth = DateTime.now();

  String _greeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good morning';
    if (hour < 17) return 'Good afternoon';
    return 'Good evening';
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                _buildTopBar(user),
                const SizedBox(height: 28),
                _buildCalendarCard(),
                const SizedBox(height: 28),
                _buildQuickActions(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar(dynamic user) {
    final name = user?.name ?? 'Taki';
    final empCode = user?.employeeCode ?? 'HNW103';
    final initials = name.length >= 2
        ? name.substring(0, 2).toUpperCase()
        : name.substring(0, 1).toUpperCase();

    final schools = ['All Schools', 'LC Silver oak', 'LC Serene Valley', 'LC Svmps'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${_greeting()} 👋',
                    style: const TextStyle(color: AppColors.textSecondary, fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(name, style: const TextStyle(color: AppColors.textPrimary, fontSize: 26, fontWeight: FontWeight.w800)),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [AppColors.primary, AppColors.purple]),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(empCode, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w800, letterSpacing: 0.5)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Neumorphic avatar
            Container(
              width: 48,
              height: 48,
              decoration: AppColors.neumorphicRaised(radius: 16),
              child: Center(
                child: Text(initials, style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w800, fontSize: 18)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        // School chips
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: schools.map((s) {
              final isActive = s == _selectedSchool;
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: GestureDetector(
                  onTap: () => setState(() => _selectedSchool = s),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: isActive
                        ? BoxDecoration(
                            gradient: const LinearGradient(colors: [AppColors.primary, AppColors.purple]),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [BoxShadow(color: AppColors.primary.withAlpha(60), blurRadius: 12, offset: const Offset(0, 4))],
                          )
                        : AppColors.neumorphicRaised(radius: 20),
                    child: Text(
                      s,
                      style: TextStyle(color: isActive ? Colors.white : AppColors.textSecondary, fontWeight: FontWeight.w700, fontSize: 13),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildCalendarCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: AppColors.neumorphicRaised(radius: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat('MMMM yyyy').format(_currentMonth),
                style: const TextStyle(color: AppColors.textPrimary, fontSize: 18, fontWeight: FontWeight.w800),
              ),
              Row(
                children: [
                  _navButton(Icons.chevron_left_rounded, () {
                    setState(() => _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1));
                  }),
                  const SizedBox(width: 4),
                  _navButton(Icons.chevron_right_rounded, () {
                    setState(() => _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1));
                  }),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'].map((d) {
              return SizedBox(
                width: 36,
                child: Center(child: Text(d, style: const TextStyle(color: AppColors.textTertiary, fontWeight: FontWeight.w700, fontSize: 12))),
              );
            }).toList(),
          ),
          const SizedBox(height: 8),
          _buildDayGrid(),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _legendChip('📌 Task', AppColors.warning),
              const SizedBox(width: 12),
              _legendChip('🔴 Urgent', AppColors.danger),
              const SizedBox(width: 12),
              _legendChip('📅 Event', AppColors.success),
            ],
          ),
        ],
      ),
    );
  }

  Widget _navButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        decoration: AppColors.neumorphicRaised(radius: 12),
        child: Icon(icon, color: AppColors.textSecondary, size: 22),
      ),
    );
  }

  Widget _buildDayGrid() {
    final firstDay = DateTime(_currentMonth.year, _currentMonth.month, 1);
    final daysInMonth = DateUtils.getDaysInMonth(_currentMonth.year, _currentMonth.month);
    final startOffset = firstDay.weekday - 1;
    final totalCells = startOffset + daysInMonth;
    final rows = ((totalCells) / 7).ceil() * 7;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: rows,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7, childAspectRatio: 1),
      itemBuilder: (context, index) {
        if (index < startOffset || index >= startOffset + daysInMonth) return const SizedBox();

        final day = index - startOffset + 1;
        final now = DateTime.now();
        final isToday = day == now.day && _currentMonth.month == now.month && _currentMonth.year == now.year;
        final hasTask = day % 7 == 0;
        final hasDeadline = day == 15;
        final hasEvent = day == 22;

        return GestureDetector(
          onTap: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 34,
                height: 34,
                decoration: isToday
                    ? BoxDecoration(
                        gradient: const LinearGradient(colors: [AppColors.primary, AppColors.purple]),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [BoxShadow(color: AppColors.primary.withAlpha(80), blurRadius: 8, offset: const Offset(0, 3))],
                      )
                    : AppColors.neumorphicFlat(radius: 12),
                child: Center(
                  child: Text(
                    '$day',
                    style: TextStyle(
                      color: isToday ? Colors.white : AppColors.textPrimary,
                      fontWeight: isToday ? FontWeight.w800 : FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (hasTask) _dot(AppColors.warning),
                  if (hasDeadline) _dot(AppColors.danger),
                  if (hasEvent) _dot(AppColors.success),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _dot(Color c) => Container(margin: const EdgeInsets.symmetric(horizontal: 1), width: 5, height: 5, decoration: BoxDecoration(color: c, shape: BoxShape.circle));

  Widget _legendChip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: AppColors.neumorphicPressed(radius: 8),
      child: Text(label, style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.w700)),
    );
  }

  Widget _buildQuickActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Quick Actions ✨', style: TextStyle(color: AppColors.textPrimary, fontSize: 18, fontWeight: FontWeight.w800)),
        const SizedBox(height: 16),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          childAspectRatio: 1.35,
          children: [
            _ActionCard(icon: Icons.edit_note_rounded, title: 'Daily Plan', subtitle: 'Copy to clipboard', iconColor: AppColors.orange, onTap: () => context.push('/daily-plan')),
            _ActionCard(icon: Icons.calendar_today_rounded, title: "Next Day's Plan", subtitle: 'Copy to clipboard', iconColor: AppColors.teal, onTap: () => context.push('/next-day-plan')),
            _ActionCard(icon: Icons.grid_view_rounded, title: 'Weekly Plan', subtitle: 'Export to Docs', iconColor: AppColors.purple),
            _ActionCard(icon: Icons.access_time_rounded, title: 'Timetable', subtitle: 'View by school', iconColor: AppColors.primary, onTap: () => context.push('/timetable')),
            const _ActionCard(icon: Icons.cloud_upload_rounded, title: 'Drive Upload', subtitle: 'Photos & media', iconColor: AppColors.danger),
            _ActionCard(icon: Icons.mic_rounded, title: 'Voice Note', subtitle: 'NLP debrief', iconColor: AppColors.success, onTap: () => context.push('/voice-debrief')),
          ],
        ),
      ],
    );
  }
}

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconColor;
  final VoidCallback? onTap;

  const _ActionCard({required this.icon, required this.title, required this.subtitle, required this.iconColor, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: AppColors.neumorphicRaised(radius: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(color: iconColor.withAlpha(35), borderRadius: BorderRadius.circular(14)),
              child: Icon(icon, color: iconColor, size: 24),
            ),
            const Spacer(),
            Text(title, style: const TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w800, fontSize: 14)),
            const SizedBox(height: 2),
            Text(subtitle, style: TextStyle(color: iconColor.withAlpha(180), fontSize: 11, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
