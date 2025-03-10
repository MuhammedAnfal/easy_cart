import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/icons/App_Circular_icon.dart';
import 'package:e_commerce/common/widgets/layOut/grid_layout.dart';
import 'package:e_commerce/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:e_commerce/features/shop/screens/home/home.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppsAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          AppCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(const HomeScreen()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.sm),
          child: Column(
            children: [
              AppGridLayout(
                  mainAxisExtend: 240,
                  itemCount: 6,
                  itemBuilder: (_, index) => const ProductCardVertical())
            ],
          ),
        ),
      ),
    );
  }
}
