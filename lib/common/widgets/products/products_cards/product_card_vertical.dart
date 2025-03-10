import 'package:e_commerce/common/styles/shadows.dart';
import 'package:e_commerce/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce/common/widgets/icons/App_Circular_icon.dart';
import 'package:e_commerce/common/widgets/images/home_rounded_image.dart';
import 'package:e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce/common/widgets/texts/app_brand_title_with_verified_icon.dart';
import 'package:e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce/features/shop/screens/product_details/product_detail.dart';
import 'package:e_commerce/features/utils/constants/colors.dart';
import 'package:e_commerce/features/utils/constants/enums.dart';
import 'package:e_commerce/features/utils/constants/image_strings.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:e_commerce/features/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardVertical extends StatefulWidget {
  const ProductCardVertical({super.key});

  @override
  State<ProductCardVertical> createState() => _ProductCardVerticalState();
}

class _ProductCardVerticalState extends State<ProductCardVertical> {
  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunction.isDarkMode(context);
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            onTap: () => Get.to(() => const ProductDetail()),
            child: Container(
              // height: AppHelperFunction.screenHeight() * 0.268,
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                boxShadow: [AppShadows.verticalProductShadow],
                borderRadius: BorderRadius.circular(AppSizes.productImageRadius),
                color: dark ? AppColors.darkGrey : AppColors.white,
              ),
              child: Column(
                //-- thumbnail
                children: [
                  TcircularContainer(
                    height: AppHelperFunction.screenHeight() * 0.16,
                    padding: const EdgeInsets.all(AppSizes.sm),
                    backgroudColor: dark ? AppColors.dark : AppColors.light,
                    child: Stack(
                      children: [
                        const HomeRoundedImage(
                          imageUrl: AppImages.shoes1,
                          applyImageRadius: true,
                        ),
                        //-- sale tag
                        Positioned(
                          top: 12,
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
                              child: Text('25%',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .apply(color: AppColors.black)),
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

                        //-- details
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: AppSizes.sm),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductTitleText(title: 'Grey Nike Jordan', smallSize: true),
                        SizedBox(
                          height: AppSizes.spaceBtwItems / 2,
                        ),
                        AppBradTitleWithVerifiedIcon(
                          title: 'Nike',
                          brandTextSized: TextSizes.large,
                        ),
                      ],
                    ),
                  ),

                  //-- price row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //-- price
                      const Padding(
                        padding: EdgeInsets.only(left: AppSizes.sm),
                        child: AppProductPriceText(
                          price: ' 35.0',
                        ),
                      ),

                      //-- add to cart button
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
          ),
        ],
      ),
    );
  }
}
