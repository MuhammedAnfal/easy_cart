import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: AppColors.grey
              ),
              borderRadius: BorderRadius.circular(100)
          ),
          child: IconButton(onPressed: () {

          }, icon: SvgPicture.asset(
            AppImages.google,
            height: AppSizes.iconLg,
            width: AppSizes.iconLg,
          )),
        ),
        const SizedBox(width: AppSizes.spaceBtwItems,),
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: AppColors.grey
              ),
              borderRadius: BorderRadius.circular(100)
          ),
          child: IconButton(onPressed: () {

          }, icon: SvgPicture.asset(
            AppImages.facebook,
            height: AppSizes.iconLg,
            width: AppSizes.iconLg,
          )),
        )
      ],
    );
  }
}
