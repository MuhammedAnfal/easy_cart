import 'package:e_commerce/features/utils/constants/colors.dart';
import 'package:e_commerce/features/utils/device/device_utility.dart';
import 'package:e_commerce/features/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class AppTabBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTabBar({super.key, required this.tabs});
  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunction.isDarkMode(context);
    return Material(
      color: dark ? AppColors.black : AppColors.white,
      child: TabBar(
          tabAlignment: TabAlignment.start,
          isScrollable: true,
          indicatorColor: AppColors.primary,
          labelColor: dark ? AppColors.white : AppColors.black,
          unselectedLabelColor: AppColors.grey,
          tabs: tabs),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppDeviceUtility.getAppBarHeight());
}
