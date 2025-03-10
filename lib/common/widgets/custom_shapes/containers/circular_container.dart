import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';

import '../../../../features/utils/constants/colors.dart';

class TcircularContainer extends StatelessWidget {
  const TcircularContainer({
    super.key,
    this.height,
    this.width,
    this.radius = AppSizes.cardRadiusLg,
    this.padding,
    this.child,
    this.backgroudColor,
    this.margin,
    this.borderColor = AppColors.borderPrimary,
    this.showBorder = true,
  });

  final double? height;
  final double? width;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  final Color? backgroudColor;
  final Color borderColor;
  final EdgeInsetsGeometry? margin;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: backgroudColor,
          border: showBorder ? Border.all(color: borderColor) : null),
      child: child,
    );
  }
}
