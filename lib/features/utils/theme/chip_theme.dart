import 'package:e_commerce/features/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class AppChipTheme {
  AppChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    backgroundColor: AppColors.grey.withOpacity(0.4),
    shadowColor: Colors.transparent,
    labelStyle: const TextStyle(color: Colors.black),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    selectedColor: AppColors.primary,
    checkmarkColor: AppColors.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    backgroundColor: AppColors.darkerGrey,
    labelStyle: TextStyle(color: Colors.white),
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    selectedColor: AppColors.primary,
    checkmarkColor: AppColors.white,
  );
}
