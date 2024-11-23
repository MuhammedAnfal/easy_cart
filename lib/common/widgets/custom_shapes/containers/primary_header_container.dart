import 'package:flutter/cupertino.dart';

import '../../../../features/utils/constants/colors.dart';
import '../../../../features/utils/device/device_utility.dart';
import '../curved_edges/curved_edge_widget.dart';
import 'circular_container.dart';

class AppPrimaryHeaderContainer extends StatelessWidget {
  const AppPrimaryHeaderContainer({required this.child,
    super.key,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AppCurvedEdgeWidget(
      child: Container(
        color: AppColors.primary,
        child: SizedBox(
          height: AppDeviceUtility.getScreenHeight() * 0.44,
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: TcircularContainer(
                  backgroudColor: AppColors.white.withOpacity(0.1),
                  height: AppDeviceUtility.getScreenHeight() * 0.44,
                  width: AppDeviceUtility.getScreenWidth(context) * 0.95,
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: TcircularContainer(
                  backgroudColor: AppColors.white.withOpacity(0.1),
                  height: AppDeviceUtility.getScreenHeight() * 0.44,
                  width: AppDeviceUtility.getScreenWidth(context) * 0.95,
                ),
              ),
              child
            ],
          ),
        ),
      ),
    );
  }
}


