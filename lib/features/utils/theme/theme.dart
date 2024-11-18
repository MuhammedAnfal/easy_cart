import 'package:e_commerce/features/utils/theme/custom_theme/appbar_theme.dart';
import 'package:e_commerce/features/utils/theme/custom_theme/bottom_sheet_theme.dart';
import 'package:e_commerce/features/utils/theme/custom_theme/checkbox_theme.dart';
import 'package:e_commerce/features/utils/theme/custom_theme/chip_theme.dart';
import 'package:e_commerce/features/utils/theme/custom_theme/elevatedbutton_theme.dart';
import 'package:e_commerce/features/utils/theme/custom_theme/outlined_button_theme.dart';
import 'package:e_commerce/features/utils/theme/custom_theme/text_field_theme.dart';
import 'package:e_commerce/features/utils/theme/custom_theme/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: AppTextTheme.lightTheme,
    chipTheme: AppChipTheme.lightThme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppbarTheme.lightTheme,
    checkboxTheme: AppCheckBoxTheme.lightTheme,
    bottomSheetTheme: AppBottomSheetTheme.lightTheme,
    elevatedButtonTheme:AppElevatedButtonTheme.lightTheme,
    outlinedButtonTheme: AppOutlinedButtonTheme.lightTheme,
    inputDecorationTheme: AppTextFormFieldTheme.lightTheme

  );
  static ThemeData darktTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'poppins',
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      textTheme: AppTextTheme.darkTheme,
      chipTheme: AppChipTheme.darkTheme,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppbarTheme.darkTheme,
      checkboxTheme: AppCheckBoxTheme.darkTheme,
      bottomSheetTheme: AppBottomSheetTheme.darkTheme,
      elevatedButtonTheme:AppElevatedButtonTheme.darkTheme,
      outlinedButtonTheme: AppOutlinedButtonTheme.darkTheme,
      inputDecorationTheme: AppTextFormFieldTheme.darkTheme

  );
}