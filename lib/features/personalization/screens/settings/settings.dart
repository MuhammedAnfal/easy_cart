import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:e_commerce/common/widgets/list_tile/settings_menu_tile.dart';
import 'package:e_commerce/common/widgets/list_tile/user_profile_tile.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/features/personalization/screens/address/address.dart';
import 'package:e_commerce/features/personalization/screens/profile/profile.dart';
import 'package:e_commerce/features/shop/screens/order/order.dart';
import 'package:e_commerce/features/utils/constants/colors.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AuthenticationRepository.instance;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //-- header
            AppPrimaryHeaderContainer(
                child: Column(
              children: [
                //-- appbar here
                AppsAppBar(
                  title: Text(
                    'Account',
                    style: Theme.of(context).textTheme.headlineMedium!.apply(color: AppColors.white),
                  ),
                ),
                //-- user profile card
                AppUserProfileTile(
                  ontap: () => Get.to(() => const ProfileScreen()),
                ),
                const SizedBox(
                  height: AppSizes.spaceBtwSections,
                )
              ],
            )),
            //-- body
            Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                children: [
                  //-- account settings
                  const AppSectionHeading(
                    title: 'Account Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwItems,
                  ),
                  AppSettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Address',
                    subTitle: 'Set shopping delivery address',
                    onTap: () => Get.to(const UserAddressScreen()),
                  ),
                  AppSettingsMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subTitle: 'Add, remove Products and move to checkout',
                    onTap: () {},
                  ),
                  AppSettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subTitle: 'In-progress and completed orders',
                    onTap: () => Get.to(() => const OrderScreen()),
                  ),
                  AppSettingsMenuTile(
                    icon: Iconsax.bank,
                    title: 'Bank Account',
                    subTitle: 'Withdraw balance to registered bank account',
                    onTap: () {},
                  ),
                  AppSettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: 'My Coupons',
                    subTitle: 'List of all discounted coupons',
                    onTap: () {},
                  ),
                  AppSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notification',
                    subTitle: 'Set any kind of notification message',
                    onTap: () {},
                  ),
                  AppSettingsMenuTile(
                    icon: Iconsax.security_card,
                    title: 'Account Privacy',
                    subTitle: 'Manage data and usage of connected accounts',
                    onTap: () {},
                  ),

                  //-- app settings
                  const SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),
                  const AppSectionHeading(
                    title: 'App Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwItems,
                  ),
                  const AppSettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: 'Load Data',
                    subTitle: 'Upload your data to Cloud Firebase',
                  ),
                  AppSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subTitle: 'Set recomendation bsed on location',
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                  AppSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Safe Mode',
                    subTitle: 'Search result in safe for all ages',
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                  AppSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'HD Image Quality',
                    subTitle: 'Set image quality to be seen',
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(onPressed: () => controller.logOut(), child: const Text('Logout')),
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwSections / 2.5,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
