import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/products.cart/cart_menu_icon.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text_strings.dart';

class AppHomeAppBar extends StatelessWidget {
  const AppHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppTexts.homeAppBarTitle,
            style: Theme.of(context).textTheme.labelMedium!.apply(color: AppColors.grey),
          ),
          Text(
            AppTexts.homeAppBarSubTitle,
            style: Theme.of(context).textTheme.headlineSmall!.apply(color: AppColors.white),
          ),
        ],
      ),
      actions: [
        AppCartCenterIcon(onPressed: () {},IconColor: AppColors.white,),
      ],
    );
  }
}
