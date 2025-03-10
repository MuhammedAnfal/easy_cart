import 'package:e_commerce/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce/common/widgets/icons/App_Circular_icon.dart';
import 'package:e_commerce/common/widgets/images/home_rounded_image.dart';
import 'package:e_commerce/common/widgets/texts/app_brand_title_with_verified_icon.dart';
import 'package:e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce/features/utils/constants/colors.dart';
import 'package:e_commerce/features/utils/constants/image_strings.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:e_commerce/features/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AppProductCardHorizondal extends StatelessWidget {
  const AppProductCardHorizondal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunction.isDarkMode(context);
    return Container(
      height: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.productImageRadius),
        color: dark ? AppColors.darkGrey : AppColors.softGrey,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //-- thumbnail
          TcircularContainer(
            height: 120,
            padding: const EdgeInsets.all(AppSizes.sm),
            backgroudColor: dark ? AppColors.dark : AppColors.light,
            child: Stack(
              children: [
                //-- thumbnail image
                const SizedBox(
                  height: 120,
                  width: 120,
                  child: HomeRoundedImage(
                    imageUrl: AppImages.shirt,
                    applyImageRadius: true,
                  ),
                ),

                //-- sale tag
                Positioned(
                  top: 10,
                  left: 5,
                  child: TcircularContainer(
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
                ),

                //-- favourite icon button
                const Positioned(
                  top: 0,
                  right: 0,
                  child: AppCircularIcon(
                    icon: Iconsax.heart5,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),

          //-- details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: AppSizes.sm, left: AppSizes.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductTitleText(title: 'White Nike Half Sleeves Shirt'),
                      SizedBox(height: AppSizes.spaceBtwItems / 2),
                      AppBradTitleWithVerifiedIcon(title: 'Nike')
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //-- pricing
                      const Flexible(child: AppProductPriceText(price: '256.0')),
                      const Spacer(),
                      //-- add to cart
                      Container(
                        width: AppSizes.iconLg * 1.2,
                        height: AppSizes.iconLg * 1.2,
                        decoration: const BoxDecoration(
                            color: AppColors.dark,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(AppSizes.cardRadiusMd),
                                bottomRight: Radius.circular(AppSizes.productImageRadius))),
                        child: const Center(
                          child: Icon(
                            Iconsax.add,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
