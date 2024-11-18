import 'package:e_commerce/features/utils/device/device_utility.dart';
import 'package:flutter/cupertino.dart';

class AppsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  Size get preferredSize => Size.fromHeight(AppDeviceUtility.getAppBarHeight());
}
