import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

/// A single step in a fog-form conversation.
class FogFormStep {
  final String question;
  final String hint;
  final FogInputType inputType;
  final List<String>? chipOptions;

  const FogFormStep({
    required this.question,
    required this.hint,
    this.inputType = FogInputType.text,
    this.chipOptions,
  });
}

enum FogInputType { text, multiLineText, chipSingle, chipMulti }

/// A conversational, step-by-step form widget.
/// Each question appears one at a time with a smooth slide-up animation.
class FogFormWidget extends StatefulWidget {
  final List<FogFormStep> steps;
  final String submitLabel;
  final IconData submitIcon;
  final Color accentColor;
  final void Function(List<String> answers) onSubmit;

  const FogFormWidget({
    super.key,
    required this.steps,
    required this.onSubmit,
    this.submitLabel = 'Generate',
    this.submitIcon = Icons.auto_awesome_rounded,
    this.accentColor = AppColors.primary,
  });

  @override
  State<FogFormWidget> createState() => _FogFormWidgetState();
}

class _FogFormWidgetState extends State<FogFormWidget> with TickerProviderStateMixin {
  int _currentStep = 0;
  late List<String> _answers;
  late List<TextEditingController> _controllers;
  late List<Set<String>> _selectedChips;
  late AnimationController _slideController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _answers = List.filled(widget.steps.length, '');
    _controllers = List.generate(widget.steps.length, (_) => TextEditingController());
    _selectedChips = List.generate(widget.steps.length, (_) => <String>{});
    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOutCubic));
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _slideController, curve: Curves.easeOut),
    );
    _slideController.forward();
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    _slideController.dispose();
    super.dispose();
  }

  void _next() {
    // Save current answer
    final step = widget.steps[_currentStep];
    if (step.inputType == FogInputType.chipSingle || step.inputType == FogInputType.chipMulti) {
      _answers[_currentStep] = _selectedChips[_currentStep].join(', ');
    } else {
      _answers[_currentStep] = _controllers[_currentStep].text.trim();
    }

    if (_currentStep < widget.steps.length - 1) {
      _slideController.reset();
      setState(() => _currentStep++);
      _slideController.forward();
    }
  }

  void _prev() {
    if (_currentStep > 0) {
      _slideController.reset();
      setState(() => _currentStep--);
      _slideController.forward();
    }
  }

  void _submit() {
    // Save final answer
    final step = widget.steps[_currentStep];
    if (step.inputType == FogInputType.chipSingle || step.inputType == FogInputType.chipMulti) {
      _answers[_currentStep] = _selectedChips[_currentStep].join(', ');
    } else {
      _answers[_currentStep] = _controllers[_currentStep].text.trim();
    }
    widget.onSubmit(_answers);
  }

  @override
  Widget build(BuildContext context) {
    final step = widget.steps[_currentStep];
    final isLast = _currentStep == widget.steps.length - 1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Progress indicator
        _buildProgress(),
        const SizedBox(height: 28),

        // Step counter
        Text(
          'Step ${_currentStep + 1} of ${widget.steps.length}',
          style: TextStyle(
            color: widget.accentColor,
            fontWeight: FontWeight.w800,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 8),

        // Question with animation
        SlideTransition(
          position: _slideAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  step.question,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 20),
                _buildInput(step),
              ],
            ),
          ),
        ),

        const Spacer(),

        // Navigation buttons
        Row(
          children: [
            if (_currentStep > 0) ...[
              GestureDetector(
                onTap: _prev,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceElevated,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(Icons.arrow_back_rounded, color: AppColors.textSecondary, size: 20),
                ),
              ),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: GestureDetector(
                onTap: isLast ? _submit : _next,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [widget.accentColor, widget.accentColor.withAlpha(200)],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: widget.accentColor.withAlpha(60),
                        blurRadius: 16,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        isLast ? widget.submitIcon : Icons.arrow_forward_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        isLast ? widget.submitLabel : 'Continue',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                        ),
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

  Widget _buildProgress() {
    return Row(
      children: List.generate(widget.steps.length, (i) {
        final isActive = i <= _currentStep;
        return Expanded(
          child: Container(
            margin: EdgeInsets.only(right: i < widget.steps.length - 1 ? 4 : 0),
            height: 4,
            decoration: BoxDecoration(
              color: isActive ? widget.accentColor : AppColors.borderSubtle,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildInput(FogFormStep step) {
    switch (step.inputType) {
      case FogInputType.text:
        return _textField(step, maxLines: 1);
      case FogInputType.multiLineText:
        return _textField(step, maxLines: 4);
      case FogInputType.chipSingle:
        return _chipSelector(step, multiSelect: false);
      case FogInputType.chipMulti:
        return _chipSelector(step, multiSelect: true);
    }
  }

  Widget _textField(FogFormStep step, {int maxLines = 1}) {
    return Container(
      decoration: AppColors.neumorphicPressed(radius: 16),
      child: TextField(
        controller: _controllers[_currentStep],
        maxLines: maxLines,
        style: const TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w600, fontSize: 15),
        decoration: InputDecoration(
          hintText: step.hint,
          hintStyle: const TextStyle(color: AppColors.textTertiary, fontWeight: FontWeight.w500),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _chipSelector(FogFormStep step, {required bool multiSelect}) {
    final options = step.chipOptions ?? [];
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: options.map((opt) {
        final selected = _selectedChips[_currentStep].contains(opt);
        return GestureDetector(
          onTap: () {
            setState(() {
              if (multiSelect) {
                if (selected) {
                  _selectedChips[_currentStep].remove(opt);
                } else {
                  _selectedChips[_currentStep].add(opt);
                }
              } else {
                _selectedChips[_currentStep] = {opt};
              }
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            decoration: selected
                ? BoxDecoration(
                    color: widget.accentColor,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [BoxShadow(color: widget.accentColor.withAlpha(50), blurRadius: 10, offset: const Offset(0, 4))],
                  )
                : AppColors.neumorphicRaised(radius: 16),
            child: Text(
              opt,
              style: TextStyle(
                color: selected ? Colors.white : AppColors.textSecondary,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
