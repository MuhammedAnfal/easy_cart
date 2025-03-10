import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/images/app_circular_images.dart';
import 'package:e_commerce/common/widgets/shimmer/shimmer.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:e_commerce/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:e_commerce/features/utils/constants/image_strings.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Scaffold(
      appBar: const AppsAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),

      //--body
      body: Obx(() {
        final networkImge = controller.user.value.profilePicture;
        final image = networkImge.isEmpty ? AppImages.userIcon : networkImge;
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.defaultSpace),
            child: Column(
              children: [
                //-- profile picture
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      controller.imageUploading.value
                          ? const AppShimmerEffect(
                              width: 80,
                              height: 80,
                              radius: 80,
                            )
                          : AppCircularImage(
                              image: controller.user.value.profilePicture,
                              isNetworkImage: networkImge != '' ? true : false,
                              height: 80,
                              width: 80,
                            ),
                      TextButton(onPressed: () => controller.uploadProfilePicture(), child: const Text('Change Profile Picture'))
                    ],
                  ),
                ),

                //-- details
                const SizedBox(height: AppSizes.spaceBtwItems),
                const Divider(),
                const SizedBox(height: AppSizes.spaceBtwItems),

                //-- heading and profile info
                const AppSectionHeading(title: 'Profile Infermation', showActionButton: false),
                const SizedBox(height: AppSizes.spaceBtwItems),

                AppProfileMenu(
                    onPressed: () => Get.to(() => const ChangeName()), tilte: 'Name', value: controller.user.value.fullName),
                AppProfileMenu(onPressed: () {}, tilte: 'Username', value: controller.user.value.userName),

                const SizedBox(height: AppSizes.spaceBtwItems),
                const Divider(),
                const SizedBox(height: AppSizes.spaceBtwItems),

                //-- heading and personal info
                const AppSectionHeading(title: 'Personal Infermation', showActionButton: false),
                const SizedBox(
                  height: AppSizes.spaceBtwItems,
                ),

                AppProfileMenu(onPressed: () {}, tilte: 'User ID', value: controller.user.value.id),
                AppProfileMenu(onPressed: () {}, tilte: 'E-mail', value: controller.user.value.email),
                AppProfileMenu(onPressed: () {}, tilte: 'Phone Number', value: controller.user.value.phoneNumber),
                AppProfileMenu(onPressed: () {}, tilte: 'Gender', value: 'Male'),
                AppProfileMenu(onPressed: () {}, tilte: 'Date Of Birth', value: '14 jul 2007'),
                const Divider(),
                const SizedBox(height: AppSizes.spaceBtwItems),

                Center(
                  child: TextButton(
                      onPressed: () => controller.deleteAccountWarningPopUp(),
                      child: const Text(
                        'Close Account',
                        style: TextStyle(color: Colors.red),
                      )),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
