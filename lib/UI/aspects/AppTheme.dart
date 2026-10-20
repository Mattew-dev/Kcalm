import 'package:flutter/material.dart';
import 'package:kcalm/UI/aspects/AppColors.dart';

class AppTheme{

  /// Tema chiaro
  static ThemeData get chiaro => ThemeData(colorScheme:
    const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primaryLight,
        onPrimary: AppColors.onPrimaryLight,
        secondary: AppColors.primaryLight,
        onSecondary: AppColors.onPrimaryLight,
        error: AppColors.errorLight,
        onError: AppColors.onErrorLight,
        surface: AppColors.surfaceLight,
        onSurface: AppColors.onSurfaceLight,
        surfaceContainer: AppColors.surfaceContainerLight,
        secondaryContainer: AppColors.primaryContainerLight,
        onSecondaryContainer: AppColors.onPrimaryContainerLight,
        onSurfaceVariant: AppColors.onSurfaceVariantLight,
    )
  );


  /// Tema scuro
  static ThemeData get scuro => ThemeData(colorScheme:
    const ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.primaryDark,
        onPrimary: AppColors.onPrimaryDark,
        secondary: AppColors.primaryDark,
        onSecondary: AppColors.onPrimaryDark,
        error: AppColors.errorDark,
        onError: AppColors.onErrorDark,
        surface: AppColors.surfaceDark,
        onSurface: AppColors.onSurfaceDark,
        surfaceContainer: AppColors.surfaceContainerDark,
        secondaryContainer: AppColors.primaryContainerDark,
        onSecondaryContainer: AppColors.onPrimaryContainerDark,
        onSurfaceVariant: AppColors.onSurfaceVariantDark,
    )
  );

}