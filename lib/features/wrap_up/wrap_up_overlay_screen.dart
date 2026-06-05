import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';

class WrapUpCallScreen extends StatefulWidget {
  const WrapUpCallScreen({super.key});

  @override
  State<WrapUpCallScreen> createState() => _WrapUpCallScreenState();
}

class _WrapUpCallScreenState extends State<WrapUpCallScreen> with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    // Setup the pulsing animation to simulate an incoming call
    _pulseController = AnimationController(vsync: this, duration: const Duration(seconds: 1))..repeat(reverse: true);
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.15).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // The overlay is full screen with a dark translucent background
    return Scaffold(
      backgroundColor: const Color(0xFF0A0C10).withAlpha(240), // Very dark near-black
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            // Caller Avatar with Pulse
            AnimatedBuilder(
              animation: _pulseAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _pulseAnimation.value,
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [AppColors.primary, AppColors.purple],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withAlpha((100 * (1.5 - _pulseAnimation.value)).toInt()),
                          blurRadius: 40,
                          spreadRadius: 10,
                        )
                      ],
                    ),
                    child: const Center(
                      child: Text('🤖', style: TextStyle(fontSize: 60)),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 40),
            
            // Caller Info
            const Text(
              'Lorenzo is calling...',
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800, letterSpacing: 0.5),
            ),
            const SizedBox(height: 12),
            const Text(
              'Time for your Curriculum Debrief',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 16, fontWeight: FontWeight.w600),
            ),
            
            const Spacer(flex: 3),
            
            // Call Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton(
                  icon: Icons.close_rounded,
                  label: 'Dismiss',
                  color: AppColors.danger,
                  onTap: () {
                    // In a real overlay, we would use FlutterOverlayWindow.close()
                    Navigator.of(context).pop();
                  },
                ),
                _buildActionButton(
                  icon: Icons.snooze_rounded,
                  label: 'Snooze 2m',
                  color: AppColors.warning,
                  onTap: () {
                    // Set snooze delta
                    Navigator.of(context).pop();
                  },
                ),
                _buildActionButton(
                  icon: Icons.call_rounded,
                  label: 'Answer',
                  color: AppColors.success,
                  isPrimary: true,
                  onTap: () {
                    // Navigate to voice debrief (STT) screen
                    context.pushReplacement('/voice-debrief');
                  },
                ),
              ],
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
    bool isPrimary = false,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: isPrimary ? 72 : 64,
            height: isPrimary ? 72 : 64,
            decoration: BoxDecoration(
              color: isPrimary ? color : AppColors.background,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: color.withAlpha(isPrimary ? 80 : 30),
                  blurRadius: 15,
                  spreadRadius: 2,
                  offset: const Offset(0, 4),
                )
              ],
              border: isPrimary ? null : Border.all(color: color.withAlpha(80), width: 2),
            ),
            child: Icon(
              icon,
              color: isPrimary ? Colors.white : color,
              size: isPrimary ? 36 : 28,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
