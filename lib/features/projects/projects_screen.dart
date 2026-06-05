import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_colors.dart';
import '../../shared/models/curriculum_model.dart';
import 'curriculum_provider.dart';

class ProjectsScreen extends ConsumerStatefulWidget {
  const ProjectsScreen({super.key});

  @override
  ConsumerState<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends ConsumerState<ProjectsScreen> {
  static const _gradeEmojis = ['🤖', '⚡', '🔧', '🚀', '🧠'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          title: const Text('Projects 🎯', style: TextStyle(color: AppColors.textPrimary, fontSize: 22, fontWeight: FontWeight.w800)),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: TabBar(
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(color: AppColors.primary.withAlpha(60), blurRadius: 10, offset: const Offset(0, 4))],
                ),
                labelColor: Colors.white,
                unselectedLabelColor: AppColors.textSecondary,
                labelStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
                unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                dividerColor: Colors.transparent,
                tabs: List.generate(5, (i) => Tab(text: '${_gradeEmojis[i]} Grade ${i + 4}')),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: List.generate(5, (i) => _GradeContent(gradeName: 'Grade ${i + 4}')),
        ),
      ),
    );
  }
}

class _GradeContent extends ConsumerWidget {
  final String gradeName;
  const _GradeContent({required this.gradeName});

  static const _statuses = [
    (ProjectStatus.toLearn, 'To Learn', AppColors.textTertiary),
    (ProjectStatus.inProgress, 'In Progress', AppColors.warning),
    (ProjectStatus.mastered, 'Mastered', AppColors.success),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProjects = ref.watch(curriculumProvider);
    final gradeProjects = allProjects.where((p) => p.grade == gradeName).toList();
    
    // Group by chapter
    final chapterMap = <int, List<CurriculumProject>>{};
    for (var p in gradeProjects) {
      chapterMap.putIfAbsent(p.chapterNumber, () => []).add(p);
    }
    final sortedChapters = chapterMap.keys.toList()..sort();

    if (gradeProjects.isEmpty) {
      return Center(
        child: Text('No projects yet for $gradeName\nTap + to add some!', 
          textAlign: TextAlign.center,
          style: const TextStyle(color: AppColors.textSecondary, fontWeight: FontWeight.w600)),
      );
    }

    return ListView(
      padding: const EdgeInsets.all(20),
      physics: const BouncingScrollPhysics(),
      children: [
        ...sortedChapters.map((chNum) {
          final projs = chapterMap[chNum]!;
          final chName = projs.first.chapterName;
          final masteredCount = projs.where((p) => p.status == ProjectStatus.mastered).length;

          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: AppColors.neumorphicRaised(radius: 20),
            child: Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                title: Text(
                  'Ch $chNum: $chName',
                  style: const TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w700, fontSize: 15),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: _ProgressBar(done: masteredCount, total: projs.length),
                ),
                children: [
                  Container(height: 1, color: AppColors.borderSubtle),
                  ...projs.map((proj) {
                    final statusData = _statuses.firstWhere((s) => s.$1 == proj.status);
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                      title: Text(proj.projectTitle, style: const TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w600)),
                      trailing: PopupMenuButton<ProjectStatus>(
                        color: AppColors.background,
                        onSelected: (newStatus) {
                          ref.read(curriculumProvider.notifier).updateProjectStatus(proj.id, newStatus);
                        },
                        itemBuilder: (ctx) => _statuses.map((s) => PopupMenuItem(
                          value: s.$1,
                          child: Text(s.$2, style: TextStyle(color: s.$3, fontWeight: FontWeight.w700)),
                        )).toList(),
                        child: _StatusBadge(label: statusData.$2, color: statusData.$3),
                      ),
                    );
                  }),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}

class _ProgressBar extends StatelessWidget {
  final int done, total;
  const _ProgressBar({required this.done, required this.total});

  @override
  Widget build(BuildContext context) {
    if (total == 0) return const SizedBox();
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 6,
            decoration: AppColors.neumorphicPressed(radius: 6),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: done / total,
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [AppColors.success, AppColors.teal]),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text('$done/$total', style: const TextStyle(color: AppColors.textSecondary, fontSize: 11, fontWeight: FontWeight.w700)),
      ],
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String label;
  final Color color;
  const _StatusBadge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: AppColors.neumorphicPressed(radius: 10),
      child: Text(label, style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w700)),
    );
  }
}
