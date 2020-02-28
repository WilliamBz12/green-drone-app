import 'package:flutter/material.dart';
import 'colors.dart';
import 'typography.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    primaryColor: AppColors.green,
    accentColor: AppColors.greenDark,
    brightness: Brightness.light,
    backgroundColor: AppColors.background,
    errorColor: AppColors.danger,
    disabledColor: AppColors.silver,
    appBarTheme: AppBarTheme(
      color: AppColors.green,
    ),
    textTheme: TextTheme(
      title: AppTypography.title,
      subtitle: AppTypography.subTitle,
    ),
    scaffoldBackgroundColor: AppColors.background,    
  );
}
