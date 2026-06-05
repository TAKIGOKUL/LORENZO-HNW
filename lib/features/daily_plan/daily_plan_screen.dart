import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../core/theme/app_colors.dart';
import '../../shared/widgets/fog_form_widget.dart';
import '../../shared/widgets/plan_preview_card.dart';

class DailyPlanScreen extends StatefulWidget {
  const DailyPlanScreen({super.key});

  @override
  State<DailyPlanScreen> createState() => _DailyPlanScreenState();
}

class _DailyPlanScreenState extends State<DailyPlanScreen> {
  String? _formattedPlan;

  static const _steps = [
    FogFormStep(
      question: 'Which school did you visit today?',
      hint: 'Select your school',
      inputType: FogInputType.chipSingle,
      chipOptions: ['LC Silver oak', 'LC Serene Valley', 'LC Svmps'],
    ),
    FogFormStep(
      question: 'What grades did you teach?',
      hint: 'Select all that apply',
      inputType: FogInputType.chipMulti,
      chipOptions: ['Grade 4', 'Grade 5', 'Grade 6', 'Grade 7', 'Grade 8'],
    ),
    FogFormStep(
      question: 'What topic or chapter was covered?',
      hint: 'e.g. STEM Orientation',
      inputType: FogInputType.text,
    ),
    FogFormStep(
      question: 'Total sessions conducted?',
      hint: 'e.g. 3',
      inputType: FogInputType.text,
    ),
    FogFormStep(
      question: 'Any sessions cancelled?',
      hint: 'e.g. Nil, or Grade 5 TULIP',
      inputType: FogInputType.text,
    ),
    FogFormStep(
      question: 'Key Activities & Outcomes?',
      hint: 'e.g. Prepared and delivered sessions...',
      inputType: FogInputType.multiLineText,
    ),
    FogFormStep(
      question: 'Any additional initiatives?',
      hint: 'e.g. Nil',
      inputType: FogInputType.multiLineText,
    ),
    FogFormStep(
      question: 'Any initiatives taken?',
      hint: 'e.g. Nil',
      inputType: FogInputType.multiLineText,
    ),
    FogFormStep(
      question: 'Challenges faced today?',
      hint: 'e.g. Nil',
      inputType: FogInputType.multiLineText,
    ),
    FogFormStep(
      question: 'Support required?',
      hint: 'e.g. Lab Computers required...',
      inputType: FogInputType.multiLineText,
    ),
  ];

  String _formatPlan(List<String> answers) {
    final date = DateFormat('dd/MM/yyyy').format(DateTime.now());
    
    final school = answers[0].isNotEmpty ? answers[0] : 'Nil';
    final grades = answers[1].isNotEmpty ? answers[1] : 'Nil';
    final topic = answers[2].isNotEmpty ? answers[2] : 'Nil';
    final sessionsConducted = '$grades - $topic';
    
    final totalSessions = answers[3].isNotEmpty ? answers[3] : '0';
    final sessionsCancelled = answers[4].isNotEmpty ? answers[4] : 'Nil';
    final keyActivities = answers[5].isNotEmpty ? answers[5] : 'Nil';
    final additionalInitiatives = answers[6].isNotEmpty ? answers[6] : 'Nil';
    final initiativesTaken = answers[7].isNotEmpty ? answers[7] : 'Nil';
    final challenges = answers[8].isNotEmpty ? answers[8] : 'Nil';
    final support = answers[9].isNotEmpty ? answers[9] : 'Nil';

    return '''Daily Report

Date: $date
Mentor: GOKUL GK
School: $school

1. Sessions Conducted

* $sessionsConducted

Total Sessions Conducted: $totalSessions
Sessions Cancelled: $sessionsCancelled

2. Key Activities & Outcomes

* $keyActivities

3. Additional Initiatives

* $additionalInitiatives

4. Initiatives Taken

* $initiativesTaken

5. Challenges Faced

* $challenges

6. Support Required

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
          'Daily Plan 📋',
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
                    title: 'Daily Plan',
                    formattedMessage: _formattedPlan!,
                    accentColor: AppColors.orange,
                    onBack: () => setState(() => _formattedPlan = null),
                  ),
                )
              : FogFormWidget(
                  steps: _steps,
                  accentColor: AppColors.orange,
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
