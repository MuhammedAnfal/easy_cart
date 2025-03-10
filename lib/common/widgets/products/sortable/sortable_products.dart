import 'package:e_commerce/common/widgets/layOut/grid_layout.dart';
import 'package:e_commerce/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AppSortableProducts extends StatelessWidget {
  const AppSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //-- dropdown
        DropdownButtonFormField(
          items: ['Name', 'Higher Price', 'Lower Price', 'Newest', 'Sale', 'Popularity']
              .map((option) => DropdownMenuItem(
                    value: option,
                    child: Text(option),
                  ))
              .toList(),
          onChanged: (value) {},
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
        ),
        const SizedBox(height: AppSizes.spaceBtwSections),
    
        //-- products
        AppGridLayout(mainAxisExtend: 240, itemCount: 8, itemBuilder: (_, index) => const ProductCardVertical())
      ],
    );
  }
}
