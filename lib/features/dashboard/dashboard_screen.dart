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

    final schools = ['All Schools', 'School A', 'School B', 'School C'];

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
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withAlpha(40),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(empCode, style: const TextStyle(color: AppColors.primary, fontSize: 11, fontWeight: FontWeight.w800, letterSpacing: 0.5)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Neumorphic avatar
            Container(
              width: 44,
              height: 44,
              decoration: const BoxDecoration(
                color: Color(0xFF1E2A44),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(initials, style: const TextStyle(color: AppColors.textSecondary, fontWeight: FontWeight.w600, fontSize: 16)),
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
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(20),
                          )
                        : BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: AppColors.borderSubtle),
                          ),
                    child: Text(
                      s,
                      style: TextStyle(color: isActive ? Colors.white : AppColors.textSecondary, fontWeight: isActive ? FontWeight.w600 : FontWeight.w500, fontSize: 13),
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
    return Column(
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _legendChip('Task / Reminder', AppColors.warning),
              const SizedBox(width: 16),
              _legendChip('Critical deadline', AppColors.danger),
              const SizedBox(width: 16),
              _legendChip('School event', AppColors.success),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(color: AppColors.borderSubtle, height: 1),
        ],
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
                        color: AppColors.primary.withAlpha(40),
                        border: Border.all(color: AppColors.primary, width: 1.5),
                        borderRadius: BorderRadius.circular(10),
                      )
                    : null,
                child: Center(
                  child: Text(
                    '$day',
                    style: TextStyle(
                      color: isToday ? Colors.white : AppColors.textPrimary,
                      fontWeight: isToday ? FontWeight.w700 : FontWeight.w500,
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
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width: 6, height: 6, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12, fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildQuickActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('QUICK ACTIONS', style: TextStyle(color: AppColors.textSecondary, fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1.2)),
        const SizedBox(height: 16),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          childAspectRatio: 1.6,
          children: [
            _ActionCard(icon: Icons.description_outlined, title: 'Daily Plan', subtitle: 'Copy to clipboard', iconColor: const Color(0xFF3B82F6), onTap: () => context.push('/daily-plan')),
            _ActionCard(icon: Icons.event_available_outlined, title: "Next Day's Plan", subtitle: 'Copy to clipboard', iconColor: const Color(0xFF10B981), onTap: () => context.push('/next-day-plan')),
            _ActionCard(icon: Icons.assignment_outlined, title: 'Weekly Plan', subtitle: 'Export to Google Docs', iconColor: const Color(0xFFF97316)),
            _ActionCard(icon: Icons.grid_view_rounded, title: 'Timetable', subtitle: 'View by school / day', iconColor: const Color(0xFF8B5CF6), onTap: () => context.push('/timetable')),
            const _ActionCard(icon: Icons.add_to_drive_outlined, title: 'Drive Upload', subtitle: 'Photos & media', iconColor: Color(0xFFEF4444)),
            _ActionCard(icon: Icons.mic_none_rounded, title: 'Voice Note', subtitle: 'NLP debrief widget', iconColor: const Color(0xFF06B6D4), onTap: () => context.push('/voice-debrief')),
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
        decoration: BoxDecoration(
          color: AppColors.surfaceCard,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.borderSubtle),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Icon(icon, color: iconColor, size: 20),
            ),
            const Spacer(),
            Text(title, style: const TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w600, fontSize: 13)),
            const SizedBox(height: 4),
            Text(subtitle, style: const TextStyle(color: AppColors.textSecondary, fontSize: 11, fontWeight: FontWeight.w400)),
          ],
        ),
      ),
    );
  }
}
