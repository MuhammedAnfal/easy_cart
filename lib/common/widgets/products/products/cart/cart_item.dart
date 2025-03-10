import 'package:e_commerce/common/widgets/images/home_rounded_image.dart';
import 'package:e_commerce/common/widgets/texts/app_brand_title_with_verified_icon.dart';
import 'package:e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce/features/utils/constants/colors.dart';
import 'package:e_commerce/features/utils/constants/image_strings.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:e_commerce/features/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class AppCartItem extends StatelessWidget {
  const AppCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunction.isDarkMode(context);
    return Row(
      children: [
        //-- image
        HomeRoundedImage(
          imageUrl: AppImages.shirt,
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(AppSizes.sm),
          backgroundColor: dark ? AppColors.darkerGrey : AppColors.light,
        ),
        const SizedBox(width: AppSizes.spaceBtwItems),

        //-- title , price and items
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppBradTitleWithVerifiedIcon(title: 'Nike'),
              const Flexible(
                  child: ProductTitleText(
                title: 'White Nike shirt wihl low price ',
                maxLines: 1,
              )),

              //-- attributes
              Text.rich(
                  softWrap: true,
                  TextSpan(children: [
                    TextSpan(text: 'Color', style: Theme.of(context).textTheme.bodySmall),
                    const WidgetSpan(child: SizedBox(width: 7)),
                    TextSpan(text: 'Green', style: Theme.of(context).textTheme.bodyLarge),
                    const WidgetSpan(child: SizedBox(width: 7)),
                    TextSpan(text: 'Size', style: Theme.of(context).textTheme.bodySmall),
                    const WidgetSpan(child: SizedBox(width: 7)),
                    TextSpan(text: 'UK 08', style: Theme.of(context).textTheme.bodyLarge),
                  ]))
            ],
          ),
        )
      ],
    );
  }
}
