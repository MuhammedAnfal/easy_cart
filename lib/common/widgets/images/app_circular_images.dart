import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/common/widgets/shimmer/shimmer.dart';
import 'package:e_commerce/features/utils/constants/colors.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:e_commerce/features/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class AppCircularImage extends StatelessWidget {
  const AppCircularImage({
    super.key,
    this.fit = BoxFit.contain,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = AppSizes.sm,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          color: backgroundColor ?? (AppHelperFunction.isDarkMode(context) ? AppColors.black : AppColors.white),
          borderRadius: BorderRadius.circular(100)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: isNetworkImage == true
            ? CachedNetworkImage(
                imageUrl: image,
                fit: fit,
                color: overlayColor,
                progressIndicatorBuilder: (context, url, progress) => const AppShimmerEffect(width: 55, height: 55),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              )
            : Image(
                fit: fit,
                image: AssetImage(image),
                color: overlayColor,
              ),
      ),
    );
  }
}
