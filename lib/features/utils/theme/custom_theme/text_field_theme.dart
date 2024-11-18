import 'package:e_commerce/main.dart';
import 'package:flutter/material.dart';

class AppTextFormFieldTheme{
  AppTextFormFieldTheme._();
  static InputDecorationTheme lightTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    labelStyle: TextStyle().copyWith(color: Colors.black,fontSize: 14),
    hintStyle: TextStyle().copyWith(color: Colors.black,fontSize: 14),
    errorStyle: TextStyle().copyWith(fontStyle:FontStyle.normal),
    floatingLabelStyle: TextStyle().copyWith(color: Colors.black.withOpacity(0.8)),

    border: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1,color: Colors.grey)
    ),
    enabledBorder: OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1,color: Colors.grey)
    ),
    focusedBorder: OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1,color: Colors.black12)
    ),
    errorBorder: OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1,color: Colors.red)
    ),
    focusedErrorBorder: OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1,color: Colors.orange)
    ),
  );
  static InputDecorationTheme darkTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    labelStyle: TextStyle().copyWith(color: Colors.white,fontSize: 14),
    hintStyle: TextStyle().copyWith(color: Colors.white,fontSize: 14),
    errorStyle: TextStyle().copyWith(fontStyle:FontStyle.normal),
    floatingLabelStyle: TextStyle().copyWith(color: Colors.white.withOpacity(0.8)),

    border: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1,color: Colors.grey)
    ),
    enabledBorder: OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1,color: Colors.grey)
    ),
    focusedBorder: OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1,color: Colors.white)
    ),
    errorBorder: OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1,color: Colors.red)
    ),
    focusedErrorBorder: OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1,color: Colors.grey)
    ),
  );
}