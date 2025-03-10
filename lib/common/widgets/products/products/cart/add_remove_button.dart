import 'package:e_commerce/common/widgets/icons/App_Circular_icon.dart';
import 'package:e_commerce/features/utils/constants/colors.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:e_commerce/features/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AppProductQuantityAddAndRemoveButton extends StatelessWidget {
  const AppProductQuantityAddAndRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunction.isDarkMode(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: AppSizes.md,
          color: dark ? AppColors.white : AppColors.black,
          backgroundColor: dark ? AppColors.darkerGrey : AppColors.light,
        ),
        const SizedBox(width: AppSizes.spaceBtwItems),
        Text('2', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: AppSizes.spaceBtwItems),
        AppCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: AppSizes.md,
          color: dark ? AppColors.white : AppColors.black,
          backgroundColor: AppColors.primary,
        ),
      ],
    );
  }
}
