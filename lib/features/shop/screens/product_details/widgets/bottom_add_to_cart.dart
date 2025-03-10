import 'package:e_commerce/common/widgets/icons/App_Circular_icon.dart';
import 'package:e_commerce/features/utils/constants/colors.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:e_commerce/features/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AppBottomAddToCart extends StatelessWidget {
  const AppBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunction.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace, vertical: AppSizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: dark ? AppColors.darkerGrey : AppColors.light,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(AppSizes.cardRadiusLg), topRight: Radius.circular(AppSizes.cardRadiusLg))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const AppCircularIcon(
                icon: Iconsax.minus,
                backgroundColor: AppColors.darkGrey,
                height: 40,
                width: 40,
                color: AppColors.white,
              ),
              const SizedBox(width: AppSizes.spaceBtwItems),
              Text('2', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(width: AppSizes.spaceBtwItems),
              const AppCircularIcon(
                icon: Iconsax.add,
                backgroundColor: AppColors.black,
                height: 40,
                width: 40,
                color: AppColors.white,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.black, padding: const EdgeInsets.all(AppSizes.md), side: const BorderSide(color: AppColors.black)),
            child: const Text('Add To Cart'),
          ),
        ],
      ),
    );
  }
}
