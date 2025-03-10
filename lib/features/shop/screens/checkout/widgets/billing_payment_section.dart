import 'package:e_commerce/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/utils/constants/colors.dart';
import 'package:e_commerce/features/utils/constants/image_strings.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:e_commerce/features/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class AppBillingPaymentSection extends StatelessWidget {
  const AppBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunction.isDarkMode(context);
    return Column(
      children: [
        AppSectionHeading(title: 'Payment Method', buttonTitle: 'Change', onPressed: () {}),
        const SizedBox(height: AppSizes.spaceBtwItems / 2),
        Row(
          children: [
            TcircularContainer(
              width: 60,
              height: 60,
              backgroudColor: dark ? AppColors.light : AppColors.white,
              padding: const EdgeInsets.all(AppSizes.md),
              child: const Image(image: AssetImage(AppImages.paypalIcon), fit: BoxFit.contain),
            ),
            const SizedBox(width: AppSizes.spaceBtwItems / 2),
            Text('payPal', style: Theme.of(context).textTheme.bodyLarge)
          ],
        )
      ],
    );
  }
}
