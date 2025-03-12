import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:e_commerce/features/utils/device/device_utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppsAppBar(
      {this.actions,
      this.leadingIcon,
      this.leadingOnPressed,
      this.showBackArrow = false,
      this.title,
      super.key});

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
      child: AppBar(
        leading: showBackArrow
            ? IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  CupertinoIcons.arrow_left,
                  color: Colors.blue,
                ))
            : leadingIcon != null
                ? IconButton(onPressed: () => leadingOnPressed, icon: Icon(leadingIcon))
                : null,
        title: title,
        automaticallyImplyLeading: showBackArrow ? true : false,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppDeviceUtility.getAppBarHeight());
}
