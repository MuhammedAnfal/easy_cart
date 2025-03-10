import 'package:e_commerce/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce/features/utils/constants/colors.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:e_commerce/features/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AppSingleAddress extends StatelessWidget {
  const AppSingleAddress({super.key, required this.selectedAddress});
  final bool selectedAddress;
  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunction.isDarkMode(context);
    return TcircularContainer(
      padding: const EdgeInsets.all(AppSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroudColor: selectedAddress ? AppColors.primary.withOpacity(0.5) : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
              ? AppColors.darkerGrey
              : AppColors.grey,
      margin: const EdgeInsets.all(AppSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress
                  ? dark
                      ? AppColors.light
                      : AppColors.dark
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '82356 Timmy Coves, South Liana, Maine, 87665, USA',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: AppSizes.sm / 2),
              const Text('(+123) 456 7890 ', maxLines: 2, overflow: TextOverflow.ellipsis, softWrap: true),
              const SizedBox(height: AppSizes.sm / 2),
            ],
          )
        ],
      ),
    );
  }
}
