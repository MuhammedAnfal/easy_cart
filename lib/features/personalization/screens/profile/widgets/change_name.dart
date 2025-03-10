import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/features/personalization/controllers/update_name_controller.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:e_commerce/features/utils/constants/text_strings.dart';
import 'package:e_commerce/features/utils/validators/validations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: AppsAppBar(
        showBackArrow: true,
        title: Text('Change Name', style: Theme.of(context).textTheme.headlineSmall),
      ), // TAppBar
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          /// Headings
          Text(
            'Use real name for easy verification. This name will appear on several pages.',
            style: Theme.of(context).textTheme.labelMedium,
          ), // Text
          const SizedBox(height: AppSizes.spaceBtwSections),
          Form(
            child: Column(
              children: [
                TextFormField(
                  controller: controller.firstName,
                  validator: (value) => AppValidator.validateEmptyText('First Name', value),
                  expands: false,
                  decoration: const  InputDecoration(labelText: AppTexts.firstName, prefixIcon: Icon(Iconsax.user)),
                ),
                const SizedBox(height: AppSizes.spaceBtwInputFields),
                TextFormField(
                  controller: controller.lastName,
                  validator: (value) => AppValidator.validateEmptyText('Last Name', value),
                  expands: false,
                  decoration: const  InputDecoration(labelText: AppTexts.lastName, prefixIcon: Icon(Iconsax.user)),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwSections),

          //-- save button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.updateUserName(),
              child: const Text('Save'),
            ),
          )
        ]),
      ),
    );
  }
}
