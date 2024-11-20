import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../features/utils/constants/colors.dart';
import '../../../features/utils/helpers/helper_function.dart';

class AppCartCenterIcon extends StatelessWidget {
  const AppCartCenterIcon({
    super.key, required this.onPressed,required this.IconColor,
  });
  final VoidCallback onPressed;
  final Color IconColor;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding:  EdgeInsets.only(right: AppHelperFunction.screenWidth() * 0.03),
          child: IconButton(onPressed: () {}, icon: const Icon(Iconsax.shopping_bag)),
        ),
        Positioned(
          top: AppHelperFunction.screenHeight() * 0.0001,
          left: AppHelperFunction.screenWidth() * 0.06,
          child: Container(
            height: AppHelperFunction.screenHeight() * 0.025,
            width: AppHelperFunction.screenWidth() * 0.05,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppHelperFunction.screenWidth()* 0.03),
              color: AppColors.black,

            ),
            child: Center(child: Text('1',
                style: Theme.of(context).textTheme.labelLarge!.apply(color: AppColors.white,fontSizeFactor: 0.8))),
          ),
        )
      ],
    );
  }
}
