import 'package:e_commerce/features/utils/constants/colors.dart';
import 'package:e_commerce/features/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmerEffect extends StatelessWidget {
  const AppShimmerEffect({super.key, required this.width, required this.height, this.radius = 15, this.color});

  final double width, height, radius;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunction.isDarkMode(context);

    return  Shimmer.fromColors(
      baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: color ?? (dark ? AppColors.darkGrey : AppColors.white),
            borderRadius: BorderRadiusDirectional.circular(radius)),
      ),
    );
  }
}
