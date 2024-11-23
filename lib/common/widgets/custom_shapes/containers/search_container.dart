
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/utils/constants/colors.dart';
import '../../../../features/utils/constants/sizes.dart';
import '../../../../features/utils/device/device_utility.dart';
import '../../../../features/utils/helpers/helper_function.dart';

class AppHomeSearchWidget extends StatelessWidget {
  const AppHomeSearchWidget({
    super.key,
    this.icon = Iconsax.search_normal,
    required this.text,
    this.showBackGround = true,
    this.showBorder = true,
  });

  final IconData? icon;
  final String text;
  final bool showBackGround, showBorder;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunction.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
      child: Container(
        width: AppDeviceUtility.getScreenWidth(context),
        padding: EdgeInsets.all(AppSizes.md),
        decoration: BoxDecoration(
            color: showBackGround
                ? dark
                ? AppColors.dark
                : AppColors.white
                : Colors.transparent,
            borderRadius: BorderRadius.circular(AppSizes.appBarHeight),
            border: showBorder ? Border.all(color: AppColors.grey) : null),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColors.darkGrey,
            ),
            const SizedBox(
              width: AppSizes.spaceBtwItems,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.bodySmall!.apply(color: AppColors.grey),
            )
          ],
        ),
      ),
    );
  }
}