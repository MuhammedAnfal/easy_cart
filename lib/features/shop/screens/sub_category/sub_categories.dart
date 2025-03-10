import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/images/home_rounded_image.dart';
import 'package:e_commerce/common/widgets/products/products_cards/product_card_horizontal.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/utils/constants/image_strings.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppsAppBar(title: Text('Sports'), showBackArrow: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              //-- banner

              const HomeRoundedImage(imageUrl: AppImages.banner1, applyImageRadius: true),
              const SizedBox(height: AppSizes.spaceBtwSections),

              //-- sub categories
              Column(
                children: [
                  //-- heading
                  AppSectionHeading(title: 'Sports Shirts', onPressed: () {}),
                  const SizedBox(height: AppSizes.spaceBtwItems / 2),

                  SizedBox(
                    height: 125,
                    child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(width: AppSizes.spaceBtwItems),
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => const AppProductCardHorizondal()),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
