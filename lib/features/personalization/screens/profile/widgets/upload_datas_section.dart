import 'package:e_commerce/features/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/list_tile/settings_menu_tile.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_function.dart';

class UploadDatasSection extends StatelessWidget {
  const UploadDatasSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = AppHelperFunction.isDarkMode(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppsAppBar(
        showBackArrow: true,
        title: Text(
          'Upload Data',
          style: Theme.of(context).textTheme.headlineMedium!.apply(color: AppColors.white),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const AppSectionHeading(
              title: AppTexts.mainRecord,
              showActionButton: false,
            ),
            const SizedBox(
              height: AppSizes.spaceBtwItems,
            ),
            const AppSettingsMenuTile(
              trailing: const Icon(Icons.cloud_upload),
              icon: Icons.border_all,
              title: AppTexts.uploadCategory,
              subTitle: 'Set shopping delivery address',
            ),
            const AppSettingsMenuTile(
              trailing: const Icon(Icons.cloud_upload),
              icon: Icons.storefront_outlined,
              title: AppTexts.uploadBrand,
              subTitle: 'Set shopping delivery address',
            ),
            const AppSettingsMenuTile(
              trailing: const Icon(Icons.cloud_upload),
              icon: Icons.add_shopping_cart,
              title: AppTexts.uploadProducts,
              subTitle: 'Set shopping delivery address',
            ),
           const AppSettingsMenuTile(
              trailing: const Icon(Icons.cloud_upload),
              icon: Icons.image,
              title: AppTexts.uploadBanners,
              subTitle: 'Set shopping delivery address',
            ),
            const SizedBox(
              height: AppSizes.spaceBtwItems,
            ),
            AppSectionHeading(
              title: AppTexts.relationShip,
              showActionButton: false,
              subTitle: 'Make sure you have already uploaded the content above',
              textColor: isDarkMode ? Colors.white : Colors.black,
            ),
            const SizedBox(
              height: AppSizes.spaceBtwItems,
            ),

            const AppSettingsMenuTile(
              trailing:  Icon(Icons.cloud_upload),
              icon: Icons.link_rounded,
              title: AppTexts.uploadBrandAndCategory,
              subTitle: '',
            ),
            const SizedBox(
              height: AppSizes.spaceBtwItems,
            ),
            const AppSettingsMenuTile(
              trailing:  Icon(Icons.cloud_upload),
              icon: Icons.link_rounded,
              title: AppTexts.uploadProductCategoriesRelational,
              subTitle: '',
            ),
            const SizedBox(
              height: AppSizes.spaceBtwItems,
            ),
          ],
        ),
      )),
    );
  }
}
