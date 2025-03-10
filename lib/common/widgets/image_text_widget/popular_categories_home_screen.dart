import 'package:e_commerce/common/widgets/images/app_circular_images.dart';
import 'package:flutter/material.dart';

import '../../../features/utils/constants/colors.dart';
import '../../../features/utils/constants/sizes.dart';
import '../../../features/utils/helpers/helper_function.dart';

class AppPopularCategoriesWidget extends StatelessWidget {
  const AppPopularCategoriesWidget({
    super.key,
    required this.image,
    required this.title,
    this.textColor = AppColors.white,
    this.backgroundColor = AppColors.white,
    this.ontap,
    this.isNetworkImage = false,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(right: AppSizes.spaceBtwItems),
        child: Column(
          children: [
            AppCircularImage(
              height: AppHelperFunction.screenHeight() * 0.06,
              width: AppHelperFunction.screenWidth() * 0.13,
              padding: AppSizes.sm * 1.4,
              isNetworkImage: isNetworkImage,
              overlayColor: dark ? AppColors.light : AppColors.dark,
              image: image,
            ),
            const SizedBox(
              height: AppSizes.spaceBtwItems / 2,
            ),
            Padding(
              padding: EdgeInsets.only(left: AppHelperFunction.screenWidth() * 0.05),
              child: SizedBox(
                  width: 55,
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.labelMedium!.apply(color: textColor),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
