import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/custom_shapes/curved_edges/curved_edge_widget.dart';
import 'package:e_commerce/common/widgets/icons/App_Circular_icon.dart';
import 'package:e_commerce/common/widgets/images/home_rounded_image.dart';
import 'package:e_commerce/features/utils/constants/colors.dart';
import 'package:e_commerce/features/utils/constants/image_strings.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:e_commerce/features/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AppProductImageSlider extends StatelessWidget {
  const AppProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunction.isDarkMode(context);
    return AppCurvedEdgeWidget(
        child: Container(
      color: dark ? AppColors.darkerGrey : AppColors.light,
      child: Stack(
        children: [
          //-- main large image
          const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(AppSizes.productImageRadius * 2),
                child: Center(child: Image(image: AssetImage(AppImages.shirt))),
              )),

          //-- image slider
          Positioned(
            right: 0,
            bottom: 30,
            left: AppSizes.defaultSpace,
            child: SizedBox(
              height: 80,
              child: ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) => HomeRoundedImage(
                        imageUrl: AppImages.shoes1,
                        width: 80,
                        backgroundColor: dark ? AppColors.dark : AppColors.light,
                        padding: const EdgeInsets.all(AppSizes.sm),
                        border: Border.all(color: AppColors.primary),
                      ),
                  separatorBuilder: (_, __) => const SizedBox(width: AppSizes.spaceBtwItems),
                  itemCount: 6),
            ),
          ),

          //-- appbar icons
          const AppsAppBar(
            showBackArrow: false,
            actions: [
              AppCircularIcon(
                icon: Iconsax.heart5,
                color: Colors.red,
              )
            ],
          )
        ],
      ),
    ));
  }
}
