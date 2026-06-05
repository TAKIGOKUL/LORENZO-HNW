import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../../core/theme/app_colors.dart';

/// Styled preview card for a generated plan with copy-to-clipboard.
class PlanPreviewCard extends StatefulWidget {
  final String title;
  final String formattedMessage;
  final Color accentColor;
  final VoidCallback? onBack;

  const PlanPreviewCard({
    super.key,
    required this.title,
    required this.formattedMessage,
    required this.accentColor,
    this.onBack,
  });

  @override
  State<PlanPreviewCard> createState() => _PlanPreviewCardState();
}

class _PlanPreviewCardState extends State<PlanPreviewCard> {
  bool _copied = false;

  void _copyToClipboard() async {
    await Clipboard.setData(ClipboardData(text: widget.formattedMessage));
    setState(() => _copied = true);
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() => _copied = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final isInWindow = now.hour >= 18 && now.hour < 19;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Time constraint banner
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: isInWindow ? AppColors.success.withAlpha(25) : AppColors.warning.withAlpha(25),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: isInWindow ? AppColors.success.withAlpha(60) : AppColors.warning.withAlpha(60)),
          ),
          child: Row(
            children: [
              Icon(
                isInWindow ? Icons.check_circle_rounded : Icons.schedule_rounded,
                color: isInWindow ? AppColors.success : AppColors.warning,
                size: 18,
              ),
              const SizedBox(width: 8),
              Text(
                isInWindow ? '✅ You\'re in the 6–7 PM window' : '⚠️ Post between 6:00 PM – 7:00 PM',
                style: TextStyle(
                  color: isInWindow ? AppColors.success : AppColors.orange,
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Title
        Text(
          '${widget.title} ✨',
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          DateFormat('EEEE, d MMMM yyyy • h:mm a').format(now),
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),

        // Message preview
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.surfaceCard,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.borderSubtle, width: 1.5),
          ),
          child: SelectableText(
            widget.formattedMessage,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w500,
              fontSize: 14,
              height: 1.6,
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Action buttons
        Row(
          children: [
            if (widget.onBack != null) ...[
              GestureDetector(
                onTap: widget.onBack,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceElevated,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.edit_rounded, color: AppColors.textSecondary, size: 18),
                      SizedBox(width: 6),
                      Text('Edit', style: TextStyle(color: AppColors.textSecondary, fontWeight: FontWeight.w700, fontSize: 13)),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: GestureDetector(
                onTap: _copyToClipboard,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    gradient: _copied
                        ? const LinearGradient(colors: [AppColors.success, AppColors.teal])
                        : LinearGradient(colors: [widget.accentColor, widget.accentColor.withAlpha(200)]),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: (_copied ? AppColors.success : widget.accentColor).withAlpha(60),
                        blurRadius: 16,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        _copied ? Icons.check_rounded : Icons.copy_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _copied ? 'Copied!' : 'Copy to Clipboard',
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
