import 'package:e_commerce/common/widgets/texts/app_brand_title_text.dart';
import 'package:e_commerce/features/utils/constants/colors.dart';
import 'package:e_commerce/features/utils/constants/enums.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AppBradTitleWithVerifiedIcon extends StatelessWidget {
  const AppBradTitleWithVerifiedIcon({
    super.key,
    required this.title,
    this.iconColor = AppColors.primary,
    this.textColor,
    this.maxLine = 1,
    this.textAlign = TextAlign.center,
    this.brandTextSized = TextSizes.small,
  });
  final String title;
  final Color? iconColor, textColor;
  final int maxLine;
  final TextAlign? textAlign;
  final TextSizes brandTextSized;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppBrandTitleText(
          title: title,
          color: textColor,
          maxLines: maxLine,
          textAlign: textAlign,
          brandTextSize: brandTextSized,
        ),
        const SizedBox(
          width : AppSizes.xs,
        ),
        const Icon(
          Iconsax.verify5,
          color: AppColors.primary,
          size: AppSizes.iconXs,
        )
      ],
    );
  }
}
