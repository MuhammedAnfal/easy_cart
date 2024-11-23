import 'package:e_commerce/features/shop/screens/home/widgets/home_appBar.dart';
import 'package:e_commerce/features/utils/constants/colors.dart';
import 'package:e_commerce/features/utils/constants/image_strings.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/texts/section_heading.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// app bar with cart icon
                  AppHomeAppBar(),

                  /// gap between the items
                  const  SizedBox(height: AppSizes.spaceBtwSections),

                  /// search field
                  AppHomeSearchWidget(
                    text: 'Search in store',
                  ),
                  const  SizedBox(height: AppSizes.spaceBtwSections),

                  /// categories
                  Padding(
                    padding:const  EdgeInsets.only(left: AppSizes.defaultSpace),
                    child: Column(
                      children: [
                        /// heading
                        AppSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                        ),
                        const SizedBox(height: AppSizes.spaceBtwItems,),

                        /// Categories
                        SizedBox(
                          height: 80,
                          child: ListView.builder(
                            itemCount: 6,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    height: 56,
                                    width: 56,
                                    padding: const  EdgeInsets.all(AppSizes.sm),
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(100)
                                    ),
                                    child: Center(
                                      child: Image(image: AssetImage(AppImages.deliveredEmailIllustration),fit: BoxFit.cover,color: AppColors.black,),
                                    ),
                                  ),
                                ],
                              );
                          },),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
