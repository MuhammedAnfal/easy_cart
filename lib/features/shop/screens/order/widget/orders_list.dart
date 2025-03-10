import 'package:e_commerce/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce/features/utils/constants/colors.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:e_commerce/features/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AppOrdersListScreen extends StatelessWidget {
  const AppOrdersListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunction.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 10,
      separatorBuilder: (_, index) => const SizedBox(
        height: AppSizes.spaceBtwItems,
      ),
      itemBuilder: (_, index) => TcircularContainer(
        padding: const EdgeInsets.all(AppSizes.md),
        showBorder: true,
        backgroudColor: dark ? AppColors.dark : AppColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //-- row 1
            Row(
              children: [
                //-- icon 1
                const Icon(Iconsax.tag),
                const SizedBox(width: AppSizes.spaceBtwItems / 2),

                //-- status and date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Processing',
                        style: Theme.of(context).textTheme.bodyLarge!.apply(fontWeightDelta: 1, color: AppColors.primary),
                      ),
                      Text('07 Nov 2024', style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Iconsax.arrow_right_34, size: AppSizes.iconSm))
              ],
            ),
            const SizedBox(height: AppSizes.spaceBtwItems),

            // -- row 2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      //-- icon 1
                      const Icon(Iconsax.ship),
                      const SizedBox(width: AppSizes.spaceBtwItems / 2),

                      //-- status and date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Shipping Date',
                              style: Theme.of(context).textTheme.labelMedium!.apply(fontWeightDelta: 1, color: AppColors.primary),
                            ),
                            Text('25 Nov 2025', style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      //-- icon 1
                      const Icon(Iconsax.calendar),
                      const SizedBox(width: AppSizes.spaceBtwItems / 2),

                      //-- status and date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Order',
                              style: Theme.of(context).textTheme.labelMedium!.apply(fontWeightDelta: 1, color: AppColors.primary),
                            ),
                            Text('[#564336]', style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
