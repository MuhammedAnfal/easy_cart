import 'package:e_commerce/features/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';

class AppShadows {
  static final verticalProductShadow = BoxShadow(
      color: AppColors.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));

  static final horiZondalProductShadow = BoxShadow(
      color: AppColors.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));
}
