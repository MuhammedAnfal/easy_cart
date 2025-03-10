import 'package:e_commerce/common/widgets/images/app_circular_images.dart';
import 'package:e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce/features/utils/constants/colors.dart';
import 'package:e_commerce/features/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AppUserProfileTile extends StatelessWidget {
  const AppUserProfileTile({
    super.key,
    this.ontap,
  });
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Obx(
      () => ListTile(
        leading: const AppCircularImage(
          image: AppImages.userIcon,
          fit: BoxFit.contain,
          width: 50,
          height: 50,
          padding: 0,
        ),
        title: Text(
          controller.user.value.fullName,
          style: Theme.of(context).textTheme.headlineSmall!.apply(color: AppColors.white),
        ),
        subtitle: Text(
          controller.user.value.email,
          style: Theme.of(context).textTheme.bodyMedium!.apply(color: AppColors.white),
        ),
        trailing: IconButton(
          onPressed: ontap,
          icon: const Icon(Iconsax.edit),
          color: AppColors.white,
        ),
      ),
    );
  }
}
