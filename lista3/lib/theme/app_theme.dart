import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const _primary = Color(0xFF4FC3F7);
  static const _onPrimary = Color(0xFF0D1B2A);
  static const _secondary = Color(0xFF8EACC8);
  static const _onSecondary = Color(0xFF0D1B2A);
  static const _accent = Color(0xFFF59E0B);
  static const _background = Color(0xFF0D1B2A);
  static const _surface = Color(0xFF1A2C42);
  static const _onSurface = Color(0xFFE8F0F7);
  static const _primaryText = Color(0xFFE8F0F7);
  static const _secondaryText = Color(0xFF8EACC8);
  static const _hint = Color(0xFF4A6A8A);
  static const _error = Color(0xFFEF5350);
  static const _onError = Color(0xFFFFFFFF);
  static const _success = Color(0xFF66BB6A);
  static const _divider = Color(0xFF2A4A6B);

  static ThemeData get light => _buildTheme();
  static ThemeData get dark => _buildTheme();

  static ThemeData _buildTheme() {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: _background,
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: _primary,
        onPrimary: _onPrimary,
        secondary: _secondary,
        onSecondary: _onSecondary,
        error: _error,
        onError: _onError,
        surface: _surface,
        onSurface: _onSurface,
      ),
      dividerColor: _divider,
      hintColor: _hint,
    );

    final inter = GoogleFonts.interTextTheme(base.textTheme);
    final textTheme = inter.copyWith(
      headlineLarge: GoogleFonts.inter(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        height: 1.2,
        color: _primaryText,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 26,
        fontWeight: FontWeight.w600,
        height: 1.25,
        color: _primaryText,
      ),
      titleLarge: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 1.2,
        color: _primaryText,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        height: 1.3,
        color: _primaryText,
      ),
      bodyLarge: GoogleFonts.jetBrainsMono(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.5,
        color: _primaryText,
      ),
      bodyMedium: GoogleFonts.jetBrainsMono(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        height: 1.4,
        color: _primaryText,
      ),
      bodySmall: GoogleFonts.jetBrainsMono(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        height: 1.4,
        color: _secondaryText,
      ),
      labelLarge: GoogleFonts.inter(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        height: 1.3,
        color: _primaryText,
      ),
      labelMedium: GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        height: 1.3,
        color: _primaryText,
      ),
      labelSmall: GoogleFonts.inter(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        height: 1.2,
        color: _secondaryText,
      ),
    );

    return base.copyWith(
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: _surface,
        foregroundColor: _primaryText,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: textTheme.titleLarge,
      ),
      cardTheme: CardThemeData(
        color: _surface,
        shadowColor: const Color(0x144FC3F7),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: _divider),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _primary,
          foregroundColor: _onPrimary,
          minimumSize: const Size.fromHeight(48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: textTheme.labelLarge,
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: _accent,
        foregroundColor: _onPrimary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _surface,
        hintStyle: textTheme.bodyMedium?.copyWith(color: _hint),
        labelStyle: textTheme.labelMedium,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: _divider),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: _primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: _error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: _error, width: 1.5),
        ),
      ),
      listTileTheme: ListTileThemeData(
        tileColor: _surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: _divider),
        ),
        iconColor: _primary,
        textColor: _primaryText,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: _surface,
        contentTextStyle: textTheme.bodyMedium,
        actionTextColor: _accent,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: _divider),
        ),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: _primary,
        selectionColor: Color(0x664FC3F7),
        selectionHandleColor: _primary,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: _success,
      ),
    );
  }
}
