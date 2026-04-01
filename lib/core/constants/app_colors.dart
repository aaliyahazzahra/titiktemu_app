import 'package:flutter/material.dart';

class AppColors {

  // ================================
  // PRIMARY BRAND COLORS
  // ================================

  static const Color deepTeal = Color(0xFF0F6D6A);       // Primary Color
  static const Color darkTeal = Color(0xFF0B5C59);       // Gradient Start
  static const Color softTeal = Color(0xFF1C8C88);       // Gradient End
  static const Color softMint = Color(0xFF7EDBD2);       // Secondary Accent
  static const Color lightCyan = Color(0xFFCFF5F2);      // Light Accent


  // ================================
  // BACKGROUND COLORS
  // ================================

  static const Color background = Color(0xFFF7F9F8);     // Main Background
  static const Color backgroundSoft = Color(0xFFF1F4F3); // Secondary Background
  static const Color cardBackground = Color(0xFFFAFBFA); // Card Background
  static const Color sectionBackground = Color(0xFFEEF3F2); // Section Background


  // ================================
  // TEXT COLORS
  // ================================

  static const Color textPrimary = Color(0xFF2E3A39);    // Dark Charcoal
  static const Color textSecondary = Color(0xFF5E6E6C);  // Soft Charcoal
  static const Color textPlaceholder = Color(0xFF9AA8A6); // Placeholder
  static const Color textDisabled = Color(0xFFB8C4C2);    // Disabled Text


  // ================================
  // GRADIENT COLORS
  // ================================

  static const List<Color> primaryGradient = [
    Color(0xFF0B5C59),
    Color(0xFF1C8C88),
    Color(0xFF7EDBD2),
  ];

  static const List<Color> softGradient = [
    Color(0xFFCFF5F2),
    Color(0xFFF7F9F8),
  ];

  static const List<Color> warmGradient = [
    Color(0xFF7EDBD2),
    Color(0xFFCFF5F2),
    Color(0xFFF7F9F8),
  ];


  // ================================
  // MOOD TRACKER COLORS
  // ================================

  static const Color moodStruggling = Color(0xFFA8BDBC);
  static const Color moodLow = Color(0xFF9FB6B5);
  static const Color moodNeutral = Color(0xFFB8D6D2);
  static const Color moodCalm = Color(0xFF7EDBD2);
  static const Color moodGood = Color(0xFF5CC7BE);


  // ================================
  // UI EFFECTS
  // ================================

  static const Color glowMint = Color(0x337EDBD2); // 20% opacity
  static const Color softShadow = Color(0x140F6D6A); // 8% opacity
  static const Color subtleBorder = Color(0xFFE3ECEA);


  // ================================
  // DARK MODE COLORS
  // ================================

  static const Color darkBackground = Color(0xFF0C1F1E);
  static const Color darkCard = Color(0xFF122B2A);
  static const Color darkText = Color(0xFFE4EFEF);
  static const Color darkAccent = Color(0xFF7EDBD2);
}