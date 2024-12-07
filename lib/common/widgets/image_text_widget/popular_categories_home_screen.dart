import 'package:flutter/cupertino.dart';
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
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: EdgeInsets.only(right: AppSizes.spaceBtwItems),
        child: Column(
          children: [
            Container(
              height: AppHelperFunction.screenHeight() * 0.06,
              width: AppHelperFunction.screenWidth() * 0.13,
              padding: const EdgeInsets.all(AppSizes.sm),
              decoration: BoxDecoration(color: backgroundColor ?? (dark ? AppColors.black : AppColors.white) , borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: Image(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                    color: dark ? AppColors.light : AppColors.dark) ,
              ),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwItems / 2,
            ),
            Padding(
              padding:  EdgeInsets.only(left:AppHelperFunction.screenWidth() * 0.05),
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
