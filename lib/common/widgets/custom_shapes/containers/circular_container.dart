import 'package:flutter/cupertino.dart';

import '../../../../features/utils/constants/colors.dart';

class TcircularContainer extends StatelessWidget {
  const TcircularContainer({
    super.key,
    this.height =400,
    this.width=400,
    this.radius = 400,
    this.padding = 0,
    this.child,
    this.backgroudColor = AppColors.white,

  });
  final double? height;
  final double? width;
  final double radius;
  final double padding;
  final Widget? child;
  final Color backgroudColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height:height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: backgroudColor
      ),
      child: child,
    );
  }
}
