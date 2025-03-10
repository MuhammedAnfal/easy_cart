import 'package:e_commerce/common/widgets/chip/choice_chip.dart';
import 'package:e_commerce/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/utils/constants/colors.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:e_commerce/features/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class AppProductAttributes extends StatelessWidget {
  const AppProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunction.isDarkMode(context);

    return Column(
      children: [
        //-- selected attributes pricing and description
        TcircularContainer(
          backgroudColor: dark ? AppColors.darkGrey : AppColors.grey,
          child: Column(
            children: [
              //--  title ,price and stock status
              Row(
                children: [
                  const AppSectionHeading(title: 'Variation', showActionButton: false),
                  const SizedBox(width: AppSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const ProductTitleText(title: 'Price : ', smallSize: true),

                          //-- actual price
                          Text(
                            '\$25',
                            style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: AppSizes.spaceBtwItems),

                          //-- sales price
                          const AppProductPriceText(price: '20')
                        ],
                      ),
                      Row(
                        children: [
                          const ProductTitleText(title: 'Stock', smallSize: true),
                          Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
                        ],
                      )
                    ],
                  ),
                ],
              ),

              //-- variation description
              const ProductTitleText(
                title: 'This is the description of the product and it is also good ,well quality products',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(width: AppSizes.spaceBtwItems),

        //-- attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppSectionHeading(title: 'Colors'),
            const SizedBox(height: AppSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                AppChoiceChip(text: 'Green', selected: true, onSelected: (p0) {}),
                AppChoiceChip(text: 'Blue', selected: false, onSelected: (p0) {}),
                AppChoiceChip(text: 'Yellow', selected: false, onSelected: (p0) {}),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppSectionHeading(title: 'Size'),
            const SizedBox(height: AppSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                AppChoiceChip(text: 'EU 34', selected: true, onSelected: (p0) {}),
                AppChoiceChip(text: 'EU 36', selected: false, onSelected: (p0) {}),
                AppChoiceChip(text: 'EU 38', selected: false, onSelected: (p0) {}),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
