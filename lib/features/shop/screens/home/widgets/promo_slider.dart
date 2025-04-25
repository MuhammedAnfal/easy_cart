import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/common/widgets/shimmer/shimmer.dart';
import 'package:e_commerce/features/shop/controllers/banner_controller.dart';
import 'package:e_commerce/features/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/images/home_rounded_image.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_function.dart';

class HomePromoCarousel extends StatelessWidget {
  const HomePromoCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(() {
      if (controller.isLoading.value) return const AppShimmerEffect(width: double.infinity, height: 190);
      if (controller.banners.isEmpty) {
        return const Center(child: Text('No Data Found!'));
      }
      return Column(
        children: [
          CarouselSlider(
            items: controller.banners
                .map((e) => HomeRoundedImage(
                      imageUrl: e.imageUrl,
                      isNetworkImage: true,
                      onPressed: () {
                        Get.toNamed(e.targetScreen);
                      },
                    ))
                .toList(),
            options: CarouselOptions(
                onPageChanged: (index, reason) {
                  controller.carouselCurrentIndex(index);
                },
                viewportFraction: 1),
          ),
          const SizedBox(
            height: AppSizes.spaceBtwItems,
          ),
          Center(
            child: Obx(
              () => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (var i = 0; i < controller.banners.length; i++)
                    TcircularContainer(
                      margin: EdgeInsets.only(left: AppHelperFunction.screenWidth() * 0.02),
                      height: AppHelperFunction.screenHeight() * 0.006,
                      width: AppHelperFunction.screenWidth() * 0.04,
                      backgroudColor: controller.carouselCurrentIndex.value == i ? AppColors.primary : AppColors.grey,
                    ),
                ],
              ),
            ),
          )
        ],
      );
    });
  }
}
