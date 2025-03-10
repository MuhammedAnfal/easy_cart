import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/utils/constants/colors.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AppBillingAddressSection extends StatelessWidget {
  const AppBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSectionHeading(title: 'Shipping Address', buttonTitle: 'change', onPressed: () {}),
        Text('Muhammed Anfal', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: AppSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.phone, color: AppColors.grey, size: 16),
            const SizedBox(width: AppSizes.spaceBtwItems),
            Text('+92-256-555666', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(width: AppSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.location_history, color: AppColors.grey, size: 16),
            const SizedBox(width: AppSizes.spaceBtwItems),
            Text('South Liana, Maine, 87695, USA', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ],
    );
  }
}
