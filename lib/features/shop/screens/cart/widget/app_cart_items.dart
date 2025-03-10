import 'package:e_commerce/common/widgets/products/products/cart/add_remove_button.dart';
import 'package:e_commerce/common/widgets/products/products/cart/cart_item.dart';
import 'package:e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:e_commerce/features/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class AppCartItems extends StatelessWidget {
  const AppCartItems({super.key, this.showAddRemoveButton = true});
  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunction.isDarkMode(context);
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (_, Index) {
          return Column(
            children: [
              const AppCartItem(),
              if (showAddRemoveButton) const SizedBox(height: AppSizes.spaceBtwItems),
              if (showAddRemoveButton)
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        //-- add & remove button
                        SizedBox(width: 70),

                        //-- add and remove button
                        AppProductQuantityAddAndRemoveButton(),
                      ],
                    ),
                    AppProductPriceText(price: '256')
                  ],
                )
            ],
          );
        },
        separatorBuilder: (_, __) => const SizedBox(height: AppSizes.spaceBtwSections),
        itemCount: 2);
  }
}
