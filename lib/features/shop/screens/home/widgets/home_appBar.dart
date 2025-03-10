import 'package:e_commerce/common/widgets/shimmer/shimmer.dart';
import 'package:e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/products/products/cart/cart_menu_icon.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text_strings.dart';

class AppHomeAppBar extends StatelessWidget {
  const AppHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return AppBar(
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppTexts.homeAppBarTitle,
              style: Theme.of(context).textTheme.labelMedium!.apply(color: AppColors.grey),
            ),
            Obx(() {
              if (controller.profileLoading.value) {
                return const AppShimmerEffect(
                  width: 80,
                  height: 15,
                );
              } else {
              
                return Text(
                  controller.user.value.fullName,
                  style: Theme.of(context).textTheme.headlineSmall!.apply(color: AppColors.white),
                );
              }
            }),
          ],
        ),
      ),
      actions: [
        AppCartCenterIcon(
          onPressed: () {},
          IconColor: AppColors.white,
        ),
      ],
    );
  }
}
