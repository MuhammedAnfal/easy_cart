import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:e_commerce/features/utils/device/device_utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppsAppBar(this.actions,this.title,this.leadingIcon,this.leadingOnPressed,this.showBackArrow,{super.key});

  final Widget title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal:AppSizes.defaultSpace),
      child:AppBar(
  leading: showBackArrow ? IconButton(onPressed: () => Get.back(), icon: Icon(CupertinoIcons.arrow_left)):
      leadingIcon != null ?  IconButton(onPressed: () => leadingOnPressed, icon: Icon(leadingIcon)):null,
      title: title,
      actions: actions,
      ),);
  }

  @override
  Size get preferredSize => Size.fromHeight(AppDeviceUtility.getAppBarHeight());
}
