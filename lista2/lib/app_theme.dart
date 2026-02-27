import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final String _primaryFont = GoogleFonts.inter().fontFamily ?? 'Inter';
  static final String _secondaryFont =
      GoogleFonts.jetBrainsMono().fontFamily ?? 'monospace';

  static ThemeData get light => _buildTheme(AppPalette.light, Brightness.light);

  static ThemeData get dark => _buildTheme(AppPalette.dark, Brightness.dark);

  static ThemeData _buildTheme(AppPalette palette, Brightness brightness) {
    final textTheme = TextTheme(
      headlineLarge: TextStyle(
        fontFamily: _primaryFont,
        fontSize: 32,
        fontWeight: FontWeight.w700,
        height: 1.2,
        color: palette.primaryText,
      ),
      headlineMedium: TextStyle(
        fontFamily: _primaryFont,
        fontSize: 26,
        fontWeight: FontWeight.w600,
        height: 1.25,
        color: palette.primaryText,
      ),
      titleLarge: TextStyle(
        fontFamily: _primaryFont,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 1.3,
        color: palette.primaryText,
      ),
      titleMedium: TextStyle(
        fontFamily: _primaryFont,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.4,
        color: palette.primaryText,
      ),
      bodyLarge: TextStyle(
        fontFamily: _primaryFont,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.5,
        color: palette.primaryText,
      ),
      bodyMedium: TextStyle(
        fontFamily: _primaryFont,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.5,
        color: palette.secondaryText,
      ),
      bodySmall: TextStyle(
        fontFamily: _secondaryFont,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.4,
        color: palette.secondaryText,
      ),
      labelLarge: TextStyle(
        fontFamily: _primaryFont,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 1.3,
        color: palette.primaryText,
      ),
      labelMedium: TextStyle(
        fontFamily: _secondaryFont,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        height: 1.3,
        color: palette.primaryText,
      ),
      labelSmall: TextStyle(
        fontFamily: _secondaryFont,
        fontSize: 10,
        fontWeight: FontWeight.w600,
        height: 1.2,
        color: palette.primaryText,
      ),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: palette.primary,
        onPrimary: palette.onPrimary,
        secondary: palette.secondary,
        onSecondary: palette.onSecondary,
        error: palette.error,
        onError: palette.onError,
        surface: palette.surface,
        onSurface: palette.onSurface,
      ),
      scaffoldBackgroundColor: palette.background,
      textTheme: textTheme,
      dividerColor: palette.divider,
      appBarTheme: AppBarTheme(
        backgroundColor: palette.surface,
        foregroundColor: palette.onSurface,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle: textTheme.titleLarge,
      ),
      extensions: <ThemeExtension<dynamic>>[
        palette,
        AppSpacing(),
        AppRadii(),
        AppShadows(),
      ],
    );
  }
}

@immutable
class AppPalette extends ThemeExtension<AppPalette> {
  const AppPalette({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.accent,
    required this.background,
    required this.surface,
    required this.onSurface,
    required this.primaryText,
    required this.secondaryText,
    required this.hint,
    required this.error,
    required this.onError,
    required this.success,
    required this.divider,
    required this.transparent,
  });

  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color onSecondary;
  final Color accent;
  final Color background;
  final Color surface;
  final Color onSurface;
  final Color primaryText;
  final Color secondaryText;
  final Color hint;
  final Color error;
  final Color onError;
  final Color success;
  final Color divider;
  final Color transparent;

  static const light = AppPalette(
    primary: Color(0xFF1A1A1A),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFF4B5563),
    onSecondary: Color(0xFFFFFFFF),
    accent: Color(0xFF2563EB),
    background: Color(0xFFFFFFFF),
    surface: Color(0xFFF9FAFB),
    onSurface: Color(0xFF111827),
    primaryText: Color(0xFF111827),
    secondaryText: Color(0xFF6B7280),
    hint: Color(0xFF9CA3AF),
    error: Color(0xFFDC2626),
    onError: Color(0xFFFFFFFF),
    success: Color(0xFF16A34A),
    divider: Color(0xFFE5E7EB),
    transparent: Color(0x00000000),
  );

  static const dark = AppPalette(
    primary: Color(0xFFF9FAFB),
    onPrimary: Color(0xFF000000),
    secondary: Color(0xFF9CA3AF),
    onSecondary: Color(0xFF000000),
    accent: Color(0xFF60A5FA),
    background: Color(0xFF000000),
    surface: Color(0xFF111111),
    onSurface: Color(0xFFF9FAFB),
    primaryText: Color(0xFFF9FAFB),
    secondaryText: Color(0xFF9CA3AF),
    hint: Color(0xFF4B5563),
    error: Color(0xFFEF4444),
    onError: Color(0xFF000000),
    success: Color(0xFF4ADE80),
    divider: Color(0xFF262626),
    transparent: Color(0x00000000),
  );

  @override
  AppPalette copyWith({
    Color? primary,
    Color? onPrimary,
    Color? secondary,
    Color? onSecondary,
    Color? accent,
    Color? background,
    Color? surface,
    Color? onSurface,
    Color? primaryText,
    Color? secondaryText,
    Color? hint,
    Color? error,
    Color? onError,
    Color? success,
    Color? divider,
    Color? transparent,
  }) {
    return AppPalette(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      accent: accent ?? this.accent,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      primaryText: primaryText ?? this.primaryText,
      secondaryText: secondaryText ?? this.secondaryText,
      hint: hint ?? this.hint,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      success: success ?? this.success,
      divider: divider ?? this.divider,
      transparent: transparent ?? this.transparent,
    );
  }

  @override
  AppPalette lerp(ThemeExtension<AppPalette>? other, double t) {
    if (other is! AppPalette) {
      return this;
    }

    return AppPalette(
      primary: Color.lerp(primary, other.primary, t) ?? primary,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t) ?? onPrimary,
      secondary: Color.lerp(secondary, other.secondary, t) ?? secondary,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t) ?? onSecondary,
      accent: Color.lerp(accent, other.accent, t) ?? accent,
      background: Color.lerp(background, other.background, t) ?? background,
      surface: Color.lerp(surface, other.surface, t) ?? surface,
      onSurface: Color.lerp(onSurface, other.onSurface, t) ?? onSurface,
      primaryText: Color.lerp(primaryText, other.primaryText, t) ?? primaryText,
      secondaryText:
          Color.lerp(secondaryText, other.secondaryText, t) ?? secondaryText,
      hint: Color.lerp(hint, other.hint, t) ?? hint,
      error: Color.lerp(error, other.error, t) ?? error,
      onError: Color.lerp(onError, other.onError, t) ?? onError,
      success: Color.lerp(success, other.success, t) ?? success,
      divider: Color.lerp(divider, other.divider, t) ?? divider,
      transparent: Color.lerp(transparent, other.transparent, t) ?? transparent,
    );
  }
}

@immutable
class AppSpacing extends ThemeExtension<AppSpacing> {
  const AppSpacing({
    this.xs = 4,
    this.sm = 8,
    this.md = 16,
    this.lg = 24,
    this.xl = 32,
  });

  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;

  @override
  AppSpacing copyWith({
    double? xs,
    double? sm,
    double? md,
    double? lg,
    double? xl,
  }) {
    return AppSpacing(
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
    );
  }

  @override
  AppSpacing lerp(ThemeExtension<AppSpacing>? other, double t) {
    if (other is! AppSpacing) {
      return this;
    }

    return AppSpacing(
      xs: lerpDouble(xs, other.xs, t),
      sm: lerpDouble(sm, other.sm, t),
      md: lerpDouble(md, other.md, t),
      lg: lerpDouble(lg, other.lg, t),
      xl: lerpDouble(xl, other.xl, t),
    );
  }
}

@immutable
class AppRadii extends ThemeExtension<AppRadii> {
  const AppRadii({this.sm = 4, this.md = 4, this.lg = 4, this.full = 9999});

  final double sm;
  final double md;
  final double lg;
  final double full;

  @override
  AppRadii copyWith({double? sm, double? md, double? lg, double? full}) {
    return AppRadii(
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      full: full ?? this.full,
    );
  }

  @override
  AppRadii lerp(ThemeExtension<AppRadii>? other, double t) {
    if (other is! AppRadii) {
      return this;
    }

    return AppRadii(
      sm: lerpDouble(sm, other.sm, t),
      md: lerpDouble(md, other.md, t),
      lg: lerpDouble(lg, other.lg, t),
      full: lerpDouble(full, other.full, t),
    );
  }
}

@immutable
class AppShadows extends ThemeExtension<AppShadows> {
  const AppShadows({
    this.sm = const BoxShadow(
      color: Color(0x0D000000),
      offset: Offset(0, 1),
      blurRadius: 2,
      spreadRadius: 0,
    ),
    this.md = const BoxShadow(
      color: Color(0x1A000000),
      offset: Offset(0, 4),
      blurRadius: 6,
      spreadRadius: -1,
    ),
    this.lg = const BoxShadow(
      color: Color(0x1A000000),
      offset: Offset(0, 10),
      blurRadius: 15,
      spreadRadius: -3,
    ),
    this.xl = const BoxShadow(
      color: Color(0x40000000),
      offset: Offset(0, 20),
      blurRadius: 25,
      spreadRadius: -5,
    ),
  });

  final BoxShadow sm;
  final BoxShadow md;
  final BoxShadow lg;
  final BoxShadow xl;

  @override
  AppShadows copyWith({
    BoxShadow? sm,
    BoxShadow? md,
    BoxShadow? lg,
    BoxShadow? xl,
  }) {
    return AppShadows(
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
    );
  }

  @override
  AppShadows lerp(ThemeExtension<AppShadows>? other, double t) {
    if (other is! AppShadows) {
      return this;
    }

    return AppShadows(
      sm: BoxShadow.lerp(sm, other.sm, t) ?? sm,
      md: BoxShadow.lerp(md, other.md, t) ?? md,
      lg: BoxShadow.lerp(lg, other.lg, t) ?? lg,
      xl: BoxShadow.lerp(xl, other.xl, t) ?? xl,
    );
  }
}

extension AppThemeContext on BuildContext {
  AppPalette get palette => Theme.of(this).extension<AppPalette>()!;

  AppSpacing get spacing => Theme.of(this).extension<AppSpacing>()!;

  AppRadii get radii => Theme.of(this).extension<AppRadii>()!;

  AppShadows get shadows => Theme.of(this).extension<AppShadows>()!;
}

double lerpDouble(double a, double b, double t) {
  return a + (b - a) * t;
}
