import 'package:e_commerce/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce/common/widgets/images/app_circular_images.dart';
import 'package:e_commerce/common/widgets/texts/app_brand_title_with_verified_icon.dart';
import 'package:e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce/features/utils/constants/colors.dart';
import 'package:e_commerce/features/utils/constants/enums.dart';
import 'package:e_commerce/features/utils/constants/image_strings.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:e_commerce/features/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/texts/product_title_text.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunction.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //-- price and sales price
        Row(
          children: [
            //-- sales tag
            TcircularContainer(
              width: AppHelperFunction.screenWidth() * 0.09,
              height: AppHelperFunction.screenHeight() * 0.03,
              radius: AppSizes.sm,
              backgroudColor: AppColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.sm,
                vertical: AppSizes.xs,
              ),
              child: Center(
                child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: AppColors.black)),
              ),
            ),

            const SizedBox(width: AppSizes.spaceBtwItems),

            //-- price
            Text('\$256', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: AppSizes.spaceBtwItems),
            const AppProductPriceText(price: '175')
          ],
        ),
        const SizedBox(width: AppSizes.spaceBtwItems / 1.5),

        //-- title
        const ProductTitleText(title: 'Grey Nike Jordaan'),
        const SizedBox(width: AppSizes.spaceBtwItems / 1.5),

        //--stock status
        Row(
          children: [
            const ProductTitleText(title: 'Status'),
            const SizedBox(width: AppSizes.spaceBtwItems),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(width: AppSizes.spaceBtwItems / 1.5),

        //-- brand
        const Row(
          children: [
            AppCircularImage(image: AppImages.shoesIcon, overlayColor: Colors.white, height: 32, width: 32),
            AppBradTitleWithVerifiedIcon(title: 'Nike', brandTextSized: TextSizes.medium),
          ],
        ),
      ],
    );
  }
}
