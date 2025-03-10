import 'package:e_commerce/features/utils/constants/colors.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:e_commerce/features/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class AppCircularIcon extends StatelessWidget {
  const AppCircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = AppSizes.lg,
    this.color,
    this.backgroundColor,
    this.onPressed,
    required this.icon,
  });

  final double? width, height, size;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: backgroundColor != null
              ? backgroundColor!
              : AppHelperFunction.isDarkMode(context)
                  ? AppColors.black.withOpacity(0.9)
                  : AppColors.white.withOpacity(0.9)),
      child: IconButton(
        icon: Icon(
          icon,
          color: color,
          size: size,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
