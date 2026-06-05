import 'package:flutter/material.dart';

class AppColors {
  // ── Standard Minimalistic Neumorphic Base (Dark Mode) ──
  static const Color background = Color(0xFF0F1117); // Near-black, blue-tinted
  static const Color surfaceCard = Color(0xFF1C1F2A); // Slightly lighter
  static const Color surfaceElevated = Color(0xFF252836); // Modal/sheet bg
  static const Color borderSubtle = Color(0x0FFFFFFF); // rgba(255,255,255,0.06)
  static const Color borderActive = Color(0x26FFFFFF); // rgba(255,255,255,0.15)

  // ── Neumorphic Shadows (Dark Theme) ──
  static const Color shadowLight = Color(0x0AFFFFFF); // Very subtle light edge
  static const Color shadowDark = Color(0xFF050608);  // Deep drop shadow

  // ── Standard Accent Colors (From Prompt) ──
  static const Color primary = Color(0xFF3B82F6);    // Electric blue
  static const Color success = Color(0xFF10B981);    // Emerald green
  static const Color warning = Color(0xFFF59E0B);    // Amber yellow
  static const Color danger = Color(0xFFEF4444);     // Red
  static const Color purple = Color(0xFF8B5CF6);     // Purple
  static const Color orange = Color(0xFFF97316);     // Orange
  static const Color teal = Color(0xFF14B8A6);       // Teal

  // ── Text Colors ──
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF9CA3AF); // Muted gray
  static const Color textTertiary = Color(0xFF6B7280);  // Very muted

  // ── Neumorphic Decoration Helpers ──

  /// Raised (convex) neumorphic effect - solid and minimal dark
  static BoxDecoration neumorphicRaised({
    double radius = 12,
    Color? color,
  }) {
    return BoxDecoration(
      color: color ?? surfaceCard,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: const [
        BoxShadow(color: shadowLight, offset: Offset(-3, -3), blurRadius: 8),
        BoxShadow(color: shadowDark, offset: Offset(4, 4), blurRadius: 10),
      ],
      border: Border.all(color: borderSubtle, width: 1),
    );
  }

  /// Pressed (concave) neumorphic effect (simulated with inner shadows/flat logic)
  static BoxDecoration neumorphicPressed({
    double radius = 12,
    Color? color,
  }) {
    return BoxDecoration(
      color: color ?? background,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: const [
        BoxShadow(color: shadowDark, offset: Offset(-2, -2), blurRadius: 4, spreadRadius: -2),
        BoxShadow(color: shadowLight, offset: Offset(2, 2), blurRadius: 4, spreadRadius: -2),
      ],
      border: Border.all(color: borderActive, width: 1),
    );
  }

  /// Flat neumorphic (no shadow, for inactive items)
  static BoxDecoration neumorphicFlat({
    double radius = 12,
    Color? color,
  }) {
    return BoxDecoration(
      color: color ?? surfaceCard,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: borderSubtle, width: 1),
    );
  }
}
