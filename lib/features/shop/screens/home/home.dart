import 'package:e_commerce/common/widgets/layOut/grid_layout.dart';
import 'package:e_commerce/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:e_commerce/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:e_commerce/features/shop/controllers/product/product_controller.dart';
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
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            AppPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// app bar with cart icon
                  const AppHomeAppBar(),

                  /// gap between the items
                  const SizedBox(height: AppSizes.spaceBtwSections),

                  /// search field
                  const AppHomeSearchWidget(
                    text: 'Search in store',
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections),

                  /// categories
                  const Padding(
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
                  ),
                  SizedBox(
                    height: context.height * 0.03,
                  )
                ],
              ),
            ),

            //-- banners in the home screen
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const HomePromoCarousel(),
                  Padding(
                    padding: const EdgeInsets.only(left: AppSizes.defaultSpace),
                    child: AppSectionHeading(
                      onPressed: () => Get.to(const AllProducts()),
                      title: 'Popular Products',
                      showActionButton: true,
                    ),
                  ),
                  Obx(() {
                    if (controller.isLoading.value) {
                      return const VerticalProductShimmer();
                    }
                    if (controller.featuredProduct.isEmpty) {
                      return Center(
                        child: Text(
                          'No Data Found',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      );
                    }
                    return AppGridLayout(
                      mainAxisExtend: 250,
                      itemBuilder: (_, index) => Padding(
                        padding: const EdgeInsets.all(8),
                        child: ProductCardVertical(
                          product: controller.featuredProduct[index],
                        ),
                      ),
                      itemCount: controller.featuredProduct.length,
                    );
                  }),
                ],
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwSections),
            //-- popular products
          ],
        ),
      ),
    );
  }
}
