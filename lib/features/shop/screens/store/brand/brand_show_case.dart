import 'package:e_commerce/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce/common/widgets/store/app_brand_card.dart';
import 'package:e_commerce/features/utils/constants/colors.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:e_commerce/features/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';


class AppBrandedShowCase extends StatelessWidget {
  const AppBrandedShowCase({
    required this.images,
    super.key,
  });
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return TcircularContainer(
      showBorder: true,
      borderColor: AppColors.darkGrey,
      backgroudColor: Colors.transparent,
      margin: const EdgeInsets.all(AppSizes.spaceBtwItems),
      padding: const EdgeInsets.all(AppSizes.md),
      child: Column(
        children: [
          //-- brand with product count
          const AppBrandCard(showBorder: false),
          //-- brand top three product images
          Row(children: images.map((image) => BrandTopProductImageWidget(image, context)).toList())
        ],
      ),
    );
  }
}

Widget BrandTopProductImageWidget(String images, context) {
  return Expanded(
    child: TcircularContainer(
      height: 100,
      backgroudColor: AppHelperFunction.isDarkMode(context) ? AppColors.darkGrey : AppColors.light,
      padding: const EdgeInsets.all(AppSizes.md),
      margin: const EdgeInsets.all(AppSizes.sm),
      child: Image(
        image: AssetImage(images),
        fit: BoxFit.contain,
      ),
    ),
  );
}
