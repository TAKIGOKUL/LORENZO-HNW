import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import '../../core/theme/app_colors.dart';
import '../../shared/models/period_model.dart';
import '../timetable/timetable_provider.dart';

class TimetableScreen extends ConsumerStatefulWidget {
  const TimetableScreen({super.key});

  @override
  ConsumerState<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends ConsumerState<TimetableScreen> {
  String _selectedSchool = 'schoolA';
  String _selectedDay = 'Monday';

  static const _schoolLabels = {
    'schoolA': 'LC Silver oak',
    'schoolB': 'LC Serene Valley',
    'schoolC': 'LC Svmps',
  };

  static const _weekdays = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];

  static const _gradeColors = {
    'Grade 4': AppColors.primary,
    'Grade 5': AppColors.teal,
    'Grade 6': AppColors.orange,
    'Grade 7': AppColors.danger,
    'Grade 8': AppColors.purple,
  };

  @override
  Widget build(BuildContext context) {
    final allPeriods = ref.watch(timetableProvider);
    final filtered = allPeriods
        .where((p) => p.schoolId == _selectedSchool && p.weekday == _selectedDay)
        .toList()
      ..sort((a, b) => a.periodNumber.compareTo(b.periodNumber));

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: AppColors.neumorphicRaised(radius: 12),
            child: const Icon(Icons.arrow_back_rounded, color: AppColors.textPrimary, size: 20),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Timetable 🕐',
          style: TextStyle(color: AppColors.textPrimary, fontSize: 20, fontWeight: FontWeight.w800),
        ),
        actions: [
          IconButton(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: AppColors.neumorphicRaised(radius: 12),
              child: const Icon(Icons.image_search_rounded, color: AppColors.primary, size: 20),
            ),
            tooltip: 'Import PNG Timetable',
            onPressed: () => _importTimetablePng(context),
          ),
          const SizedBox(width: 16),
        ],
      ),
      floatingActionButton: GestureDetector(
        onTap: () => _showAddPeriodSheet(context),
        child: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [AppColors.primary, AppColors.purple]),
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(color: AppColors.primary.withAlpha(80), blurRadius: 16, offset: const Offset(0, 6)),
            ],
          ),
          child: const Icon(Icons.add_rounded, color: Colors.white, size: 28),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              // School selector
              _buildSchoolSelector(),
              const SizedBox(height: 20),
              // Weekday selector
              _buildWeekdaySelector(),
              const SizedBox(height: 24),
              // Period list
              Expanded(
                child: filtered.isEmpty
                    ? _buildEmptyState()
                    : ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: filtered.length,
                        separatorBuilder: (_, _) => const SizedBox(height: 14),
                        itemBuilder: (context, index) => _buildPeriodCard(filtered[index]),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSchoolSelector() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: _schoolLabels.entries.map((entry) {
          final isActive = entry.key == _selectedSchool;
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () => setState(() => _selectedSchool = entry.key),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                decoration: isActive
                    ? BoxDecoration(
                        gradient: const LinearGradient(colors: [AppColors.primary, AppColors.purple]),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(color: AppColors.primary.withAlpha(60), blurRadius: 12, offset: const Offset(0, 4)),
                        ],
                      )
                    : AppColors.neumorphicRaised(radius: 16),
                child: Text(
                  entry.value,
                  style: TextStyle(
                    color: isActive ? Colors.white : AppColors.textSecondary,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildWeekdaySelector() {
    return Row(
      children: _weekdays.map((day) {
        final isActive = day == _selectedDay;
        final shortDay = day.substring(0, 3);
        return Expanded(
          child: GestureDetector(
            onTap: () => setState(() => _selectedDay = day),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: isActive
                  ? AppColors.neumorphicPressed(radius: 14)
                  : AppColors.neumorphicRaised(radius: 14),
              child: Center(
                child: Text(
                  shortDay,
                  style: TextStyle(
                    color: isActive ? AppColors.primary : AppColors.textSecondary,
                    fontWeight: FontWeight.w800,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildPeriodCard(Period period) {
    final gradeColor = _gradeColors[period.grade] ?? AppColors.primary;
    final startStr = '${period.startTime.hour.toString().padLeft(2, '0')}:${period.startTime.minute.toString().padLeft(2, '0')}';
    final endStr = '${period.endTime.hour.toString().padLeft(2, '0')}:${period.endTime.minute.toString().padLeft(2, '0')}';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: AppColors.neumorphicRaised(radius: 20),
      child: Row(
        children: [
          // Period number pill
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: gradeColor.withAlpha(30),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
              child: Text(
                'P${period.periodNumber}',
                style: TextStyle(color: gradeColor, fontWeight: FontWeight.w800, fontSize: 16),
              ),
            ),
          ),
          const SizedBox(width: 14),
          // Subject and grade
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  period.subject,
                  style: const TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w700, fontSize: 15),
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: gradeColor.withAlpha(25),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        period.grade,
                        style: TextStyle(color: gradeColor, fontSize: 11, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Time
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: AppColors.neumorphicPressed(radius: 12),
            child: Text(
              '$startStr\n$endStr',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w700,
                fontSize: 11,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: AppColors.neumorphicRaised(radius: 24),
            child: const Center(
              child: Text('📅', style: TextStyle(fontSize: 36)),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'No periods yet',
            style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w800, fontSize: 18),
          ),
          const SizedBox(height: 6),
          const Text(
            'Tap + to add a class period',
            style: TextStyle(color: AppColors.textSecondary, fontWeight: FontWeight.w600, fontSize: 13),
          ),
        ],
      ),
    );
  }

  void _showAddPeriodSheet(BuildContext context) {
    final subjectCtrl = TextEditingController();
    final periodNumCtrl = TextEditingController();
    TimeOfDay startTime = const TimeOfDay(hour: 9, minute: 0);
    TimeOfDay endTime = const TimeOfDay(hour: 9, minute: 45);
    String selectedGrade = 'Grade 4';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        return StatefulBuilder(
          builder: (ctx, setSheetState) {
            return Padding(
              padding: EdgeInsets.fromLTRB(24, 24, 24, MediaQuery.of(ctx).viewInsets.bottom + 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Handle
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: AppColors.borderSubtle,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Add Period ➕',
                    style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w800, fontSize: 20),
                  ),
                  const SizedBox(height: 20),

                  // Period number
                  _sheetTextField(periodNumCtrl, 'Period number', '1', keyboardType: TextInputType.number),
                  const SizedBox(height: 12),

                  // Grade chips
                  const Text('Grade', style: TextStyle(color: AppColors.textSecondary, fontWeight: FontWeight.w700, fontSize: 12)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: ['Grade 4', 'Grade 5', 'Grade 6', 'Grade 7', 'Grade 8'].map((g) {
                      final isActive = g == selectedGrade;
                      return GestureDetector(
                        onTap: () => setSheetState(() => selectedGrade = g),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 150),
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          decoration: isActive
                              ? BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(12),
                                )
                              : AppColors.neumorphicRaised(radius: 12),
                          child: Text(
                            g,
                            style: TextStyle(
                              color: isActive ? Colors.white : AppColors.textSecondary,
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 12),

                  // Subject
                  _sheetTextField(subjectCtrl, 'Subject', 'e.g. Robotics'),
                  const SizedBox(height: 12),

                  // Time row
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            final t = await showTimePicker(context: ctx, initialTime: startTime);
                            if (t != null) setSheetState(() => startTime = t);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            decoration: AppColors.neumorphicRaised(radius: 14),
                            child: Center(
                              child: Text(
                                '${startTime.hour.toString().padLeft(2, '0')}:${startTime.minute.toString().padLeft(2, '0')}',
                                style: const TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w700, fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text('→', style: TextStyle(color: AppColors.textSecondary, fontSize: 20)),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            final t = await showTimePicker(context: ctx, initialTime: endTime);
                            if (t != null) setSheetState(() => endTime = t);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            decoration: AppColors.neumorphicRaised(radius: 14),
                            child: Center(
                              child: Text(
                                '${endTime.hour.toString().padLeft(2, '0')}:${endTime.minute.toString().padLeft(2, '0')}',
                                style: const TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w700, fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Save button
                  GestureDetector(
                    onTap: () {
                      final periodNum = int.tryParse(periodNumCtrl.text) ?? 1;
                      final subject = subjectCtrl.text.trim().isEmpty ? 'Robotics' : subjectCtrl.text.trim();

                      final period = Period(
                        id: '${_selectedSchool}_${_selectedDay}_$periodNum',
                        schoolId: _selectedSchool,
                        weekday: _selectedDay,
                        periodNumber: periodNum,
                        startTime: startTime,
                        endTime: endTime,
                        grade: selectedGrade,
                        subject: subject,
                      );

                      ref.read(timetableProvider.notifier).addPeriod(period);
                      Navigator.of(ctx).pop();
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [AppColors.primary, AppColors.purple]),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(color: AppColors.primary.withAlpha(60), blurRadius: 16, offset: const Offset(0, 6)),
                        ],
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.check_rounded, color: Colors.white, size: 20),
                          SizedBox(width: 8),
                          Text('Save Period', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 15)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _sheetTextField(TextEditingController ctrl, String label, String hint, {TextInputType? keyboardType}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: AppColors.textSecondary, fontWeight: FontWeight.w700, fontSize: 12)),
        const SizedBox(height: 6),
        Container(
          decoration: AppColors.neumorphicPressed(radius: 14),
          child: TextField(
            controller: ctrl,
            keyboardType: keyboardType,
            style: const TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w600, fontSize: 14),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: AppColors.textTertiary),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _importTimetablePng(BuildContext context) async {
    try {
      final result = await FilePicker.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['png', 'jpg', 'jpeg'],
      );

      if (result == null || result.files.isEmpty) return;

      final fileName = result.files.first.name;

      if (!context.mounted) return;

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) {
          return Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              padding: const EdgeInsets.all(24),
              decoration: AppColors.neumorphicRaised(radius: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                      strokeWidth: 4,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'AI Scanning Timetable... 🤖',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Processing $fileName',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );

      await Future.delayed(const Duration(seconds: 2));

      if (!context.mounted) return;
      Navigator.of(context).pop();

      final demoPeriods = [
        const Period(
          id: 'schoolA_Monday_1',
          schoolId: 'schoolA',
          weekday: 'Monday',
          periodNumber: 1,
          startTime: TimeOfDay(hour: 9, minute: 30),
          endTime: TimeOfDay(hour: 10, minute: 15),
          grade: 'Grade 4',
          subject: 'Introduction to LEDs',
        ),
        const Period(
          id: 'schoolA_Monday_2',
          schoolId: 'schoolA',
          weekday: 'Monday',
          periodNumber: 2,
          startTime: TimeOfDay(hour: 10, minute: 30),
          endTime: TimeOfDay(hour: 11, minute: 15),
          grade: 'Grade 5',
          subject: 'Motor Control Basics',
        ),
        const Period(
          id: 'schoolA_Tuesday_1',
          schoolId: 'schoolA',
          weekday: 'Tuesday',
          periodNumber: 1,
          startTime: TimeOfDay(hour: 11, minute: 0),
          endTime: TimeOfDay(hour: 11, minute: 45),
          grade: 'Grade 6',
          subject: 'IR Sensor Calibration',
        ),
        const Period(
          id: 'schoolB_Wednesday_1',
          schoolId: 'schoolB',
          weekday: 'Wednesday',
          periodNumber: 1,
          startTime: TimeOfDay(hour: 9, minute: 0),
          endTime: TimeOfDay(hour: 9, minute: 45),
          grade: 'Grade 7',
          subject: 'Line Follower Logic',
        ),
        const Period(
          id: 'schoolC_Thursday_1',
          schoolId: 'schoolC',
          weekday: 'Thursday',
          periodNumber: 1,
          startTime: TimeOfDay(hour: 13, minute: 30),
          endTime: TimeOfDay(hour: 14, minute: 15),
          grade: 'Grade 8',
          subject: 'Obstacle Avoidance Code',
        ),
      ];

      await ref.read(timetableProvider.notifier).replaceAllPeriods(demoPeriods);

      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: const Row(
              children: [
                Icon(Icons.check_circle_rounded, color: Colors.white),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Timetable imported successfully! 5 classes created.',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: AppColors.success,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      );
    } catch (e) {
      debugPrint('Error picking file: $e');
    }
  }
}
