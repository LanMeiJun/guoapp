import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract final class AppTheme {
  static final light = _theme(Brightness.light);
  static final dark = _theme(Brightness.dark);

  static ThemeMode mode(String preference) => switch (preference) {
    'light' => ThemeMode.light,
    'dark' => ThemeMode.dark,
    _ => ThemeMode.system,
  };

  static String label(String preference) => switch (preference) {
    'light' => '浅色',
    'dark' => '深色',
    _ => '跟随系统',
  };

  static SystemUiOverlayStyle systemBars(Brightness brightness) {
    final icons = brightness == Brightness.dark
        ? Brightness.light
        : Brightness.dark;
    return SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: icons,
      statusBarBrightness: brightness,
      systemStatusBarContrastEnforced: false,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: icons,
      systemNavigationBarContrastEnforced: false,
    );
  }

  static ThemeData _theme(Brightness brightness) {
    final dark = brightness == Brightness.dark;
    final background = dark
        ? const Color(0xFF0F1218)
        : const Color(0xFFF4F6FB);
    final scheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF3D7BF9),
      brightness: brightness,
      primary: dark ? const Color(0xFF7FA8FF) : const Color(0xFF2A63D6),
      onPrimary: dark ? const Color(0xFF0A1B3D) : Colors.white,
      primaryContainer: dark
          ? const Color(0xFF1B3A73)
          : const Color(0xFFDCE7FF),
      onPrimaryContainer: dark
          ? const Color(0xFFDCE7FF)
          : const Color(0xFF0B2C6B),
      secondary: dark ? const Color(0xFF9FB6E8) : const Color(0xFF43609A),
      onSecondary: dark ? const Color(0xFF101B33) : Colors.white,
      secondaryContainer: dark
          ? const Color(0xFF243354)
          : const Color(0xFFE1E8F7),
      onSecondaryContainer: dark
          ? const Color(0xFFDCE4F8)
          : const Color(0xFF1B2942),
      tertiary: dark ? const Color(0xFFFF8C79) : const Color(0xFFE1493A),
      onTertiary: dark ? const Color(0xFF41100A) : Colors.white,
      tertiaryContainer: dark
          ? const Color(0xFF5C2A22)
          : const Color(0xFFFFE2DC),
      onTertiaryContainer: dark
          ? const Color(0xFFFFE2DC)
          : const Color(0xFF541008),
      surface: dark ? const Color(0xFF171B22) : Colors.white,
      onSurface: dark ? const Color(0xFFE9ECF4) : const Color(0xFF1B1E24),
      onSurfaceVariant: dark
          ? const Color(0xFFA9AEBA)
          : const Color(0xFF5D6470),
      outline: dark ? const Color(0xFF8A909C) : const Color(0xFF767D89),
      outlineVariant: dark
          ? const Color(0xFF2C313A)
          : const Color(0xFFE1E5EE),
      surfaceContainerLowest: dark ? const Color(0xFF0C0F14) : Colors.white,
      surfaceContainerLow: dark
          ? const Color(0xFF1D222A)
          : const Color(0xFFEEF1F8),
      surfaceContainer: dark
          ? const Color(0xFF222833)
          : const Color(0xFFE9EDF6),
      surfaceContainerHigh: dark
          ? const Color(0xFF2A313C)
          : const Color(0xFFE3E8F3),
      surfaceContainerHighest: dark
          ? const Color(0xFF333B47)
          : const Color(0xFFDCE2EF),
      surfaceTint: Colors.transparent,
    );
    final radius = BorderRadius.circular(16);
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: background,
      appBarTheme: AppBarTheme(
        backgroundColor: background,
        foregroundColor: scheme.onSurface,
        scrolledUnderElevation: 0,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: scheme.onSurface,
          fontSize: 19,
          fontWeight: FontWeight.w700,
        ),
        systemOverlayStyle: systemBars(brightness),
      ),
      cardTheme: CardThemeData(
        color: scheme.surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: radius),
      ),
      dividerTheme: DividerThemeData(color: scheme.outlineVariant),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: background,
        useIndicator: false,
        selectedIconTheme: IconThemeData(color: scheme.primary),
        unselectedIconTheme: IconThemeData(color: scheme.onSurfaceVariant),
        selectedLabelTextStyle: TextStyle(
          color: scheme.primary,
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelTextStyle: TextStyle(color: scheme.onSurfaceVariant),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: scheme.surfaceContainer,
        hintStyle: TextStyle(color: scheme.onSurfaceVariant),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: radius,
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: radius,
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: radius,
          borderSide: BorderSide(color: scheme.primary, width: 1.4),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: scheme.surfaceContainer,
        selectedColor: scheme.primaryContainer,
        side: BorderSide.none,
        labelStyle: TextStyle(color: scheme.onSurface),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          minimumSize: const Size(0, 46),
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: scheme.primary,
      ),
    );
  }
}