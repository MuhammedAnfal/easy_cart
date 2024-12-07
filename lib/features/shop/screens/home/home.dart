import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/home_appBar.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/home_categories.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:e_commerce/features/utils/helpers/helper_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/images/home_rounded_image.dart';
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
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppPrimaryHeaderContainer(
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
            Padding(
              padding: EdgeInsets.all(
                AppSizes.defaultSpace,
              ),
              child: HomePromoCarousel(
                banners: [
                  AppImages.banner1,
                  AppImages.banner1,
                  AppImages.banner1,
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
