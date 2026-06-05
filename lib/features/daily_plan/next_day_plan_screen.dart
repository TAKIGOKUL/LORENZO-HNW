import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../core/theme/app_colors.dart';
import '../../shared/widgets/fog_form_widget.dart';
import '../../shared/widgets/plan_preview_card.dart';

class NextDayPlanScreen extends StatefulWidget {
  const NextDayPlanScreen({super.key});

  @override
  State<NextDayPlanScreen> createState() => _NextDayPlanScreenState();
}

class _NextDayPlanScreenState extends State<NextDayPlanScreen> {
  String? _formattedPlan;

  static const _steps = [
    FogFormStep(
      question: 'Which school are you visiting tomorrow?',
      hint: 'Select your school',
      inputType: FogInputType.chipSingle,
      chipOptions: ['LC Silver oak', 'LC Serene Valley', 'LC Svmps'],
    ),
    FogFormStep(
      question: 'Planned Sessions?',
      hint: 'e.g. Grades 4-8 (Uncertain schedule)',
      inputType: FogInputType.multiLineText,
    ),
    FogFormStep(
      question: 'Planned Activities & Deliverables?',
      hint: 'e.g. Prepare orientation for grade 4 to 8',
      inputType: FogInputType.multiLineText,
    ),
    FogFormStep(
      question: 'Additional Initiatives?',
      hint: 'e.g. Nil',
      inputType: FogInputType.multiLineText,
    ),
    FogFormStep(
      question: 'Support Required?',
      hint: 'e.g. Nil',
      inputType: FogInputType.multiLineText,
    ),
  ];

  String _formatPlan(List<String> answers) {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    final date = DateFormat('dd/MM/yyyy').format(tomorrow);
    
    final school = answers[0].isNotEmpty ? answers[0] : 'Nil';
    final plannedSessions = answers[1].isNotEmpty ? answers[1] : 'Nil';
    final plannedActivities = answers[2].isNotEmpty ? answers[2] : 'Nil';
    final initiatives = answers[3].isNotEmpty ? answers[3] : 'Nil';
    final support = answers[4].isNotEmpty ? answers[4] : 'Nil';

    return '''Next Day's Plan

Date : $date
Mentor: Gokul G K
School : $school

1. Planned Sessions

* $plannedSessions

2. Planned Activities & Deliverables

* $plannedActivities

3. Additional Initiatives

* $initiatives

4. Support Required

* $support''';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: AppColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          "Next Day's Plan 📅",
          style: TextStyle(color: AppColors.textPrimary, fontSize: 18, fontWeight: FontWeight.w800),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
          child: _formattedPlan != null
              ? SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: PlanPreviewCard(
                    title: "Next Day's Plan",
                    formattedMessage: _formattedPlan!,
                    accentColor: AppColors.teal,
                    onBack: () => setState(() => _formattedPlan = null),
                  ),
                )
              : FogFormWidget(
                  steps: _steps,
                  accentColor: AppColors.teal,
                  submitLabel: 'Generate Plan',
                  submitIcon: Icons.auto_awesome_rounded,
                  onSubmit: (answers) {
                    setState(() => _formattedPlan = _formatPlan(answers));
                  },
                ),
        ),
      ),
    );
  }
}
