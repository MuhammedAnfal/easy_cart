import 'package:e_commerce/common/widgets/layOut/grid_layout.dart';
import 'package:e_commerce/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/shop/models/category_model.dart';
import 'package:e_commerce/features/shop/screens/store/brand/brand_show_case.dart';
import 'package:e_commerce/features/utils/constants/image_strings.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppCategoryTab extends StatelessWidget {
  const AppCategoryTab({super.key, required this.categories});
  final RxList<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), children: [
      Padding(
        padding: const EdgeInsets.all(AppSizes.sm),
        child: Column(
          children: [
            //-- brands
            const AppBrandedShowCase(
              images: [
                AppImages.jacket,
                AppImages.jacket1,
                AppImages.jacket2,
              ],
            ),
            const AppBrandedShowCase(
              images: [
                AppImages.jacket,
                AppImages.jacket1,
                AppImages.jacket2,
              ],
            ),
            //-- products
            AppSectionHeading(
              title: 'You might like',
              showActionButton: true,
              onPressed: () {},
            ),
            const SizedBox(
              height: AppSizes.spaceBtwItems,
            ),
            AppGridLayout(
                mainAxisExtend: 230,
                itemCount: 4,
                itemBuilder: (_, index) => const Padding(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: ProductCardVertical(),
                    )),
            const SizedBox(
              height: AppSizes.spaceBtwSections,
            ),
          ],
        ),
      ),
    ]);
  }
}
