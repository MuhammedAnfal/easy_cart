import 'package:e_commerce/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce/common/widgets/images/app_circular_images.dart';
import 'package:e_commerce/common/widgets/texts/app_brand_title_with_verified_icon.dart';
import 'package:e_commerce/features/utils/constants/colors.dart';
import 'package:e_commerce/features/utils/constants/enums.dart';
import 'package:e_commerce/features/utils/constants/image_strings.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:e_commerce/features/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class AppBrandCard extends StatelessWidget {
  const AppBrandCard({
    super.key,
    required this.showBorder,
    this.ontap,
  });

  final bool showBorder;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: ontap  ,
      child: TcircularContainer(
        padding: const EdgeInsets.all(AppSizes.sm),
        showBorder: showBorder,
        backgroudColor: Colors.transparent,
        child: Row(
          children: [
            Flexible(
              child: TcircularContainer(
                showBorder: true,
                borderColor: AppColors.grey,
                backgroudColor: Colors.transparent,
                //-- icon

                child: AppCircularImage(
                  image: AppImages.clothIcon,
                  overlayColor: dark ? AppColors.white : AppColors.black,
                ),
              ),
            ),
            const SizedBox(width: AppSizes.spaceBtwItems / 2),
            //-- text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const AppBradTitleWithVerifiedIcon(
                    title: 'Nike',
                    brandTextSized: TextSizes.large,
                  ),
                  Text('256 Products', overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.labelMedium)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
