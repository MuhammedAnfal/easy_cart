import 'package:e_commerce/common/widgets/layOut/grid_layout.dart';
import 'package:e_commerce/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:e_commerce/features/shop/screens/all_products/all_products.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/home_appBar.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/home_categories.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../utils/constants/image_strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  var index;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const AppPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// app bar with cart icon
                  AppHomeAppBar(),

                  /// gap between the items
                  SizedBox(height: AppSizes.spaceBtwSections),

                  /// search field
                  AppHomeSearchWidget(
                    text: 'Search in store',
                  ),
                  SizedBox(height: AppSizes.spaceBtwSections),

                  /// categories
                  Padding(
                    padding: EdgeInsets.only(left: AppSizes.defaultSpace),
                    child: Column(
                      children: [
                        /// heading
                        AppSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                        ),
                        SizedBox(
                          height: AppSizes.spaceBtwItems,
                        ),

                        /// Categories
                        AppHomeScreenCategories()
                      ],
                    ),
                  )
                ],
              ),
            ),

            //-- banners in the home screen
            Column(
              children: [
                const HomePromoCarousel(
                  banners: [
                    AppImages.banner1,
                    AppImages.banner2,
                    AppImages.banner3,
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: AppSizes.defaultSpace),
                  child: AppSectionHeading(
                    onPressed: () => Get.to(const AllProducts()),
                    title: 'Popular Products',
                    showActionButton: true,
                  ),
                ),
                AppGridLayout(
                  mainAxisExtend: 250,
                  itemBuilder: (_, index) => const Padding(
                    padding: EdgeInsets.all(8),
                    child: ProductCardVertical(),
                  ),
                  itemCount: 2,
                ),
              ],
            ),
            const SizedBox(height: AppSizes.spaceBtwSections),
            //-- popular products
          ],
        ),
      ),
    );
  }
}
