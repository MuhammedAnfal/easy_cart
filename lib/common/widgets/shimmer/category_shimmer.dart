import 'package:e_commerce/common/widgets/shimmer/shimmer.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:flutter/widgets.dart';

class AppCategoryShimmer extends StatelessWidget {
  const AppCategoryShimmer({super.key, this.itemCount = 6});
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 800,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppShimmerEffect(
                width: 55,
                height: 55,
                radius: 55,
              ),
              SizedBox(
                height: AppSizes.spaceBtwItems / 2,
              ),
              AppShimmerEffect(
                width: 55,
                height: 8,
              )
            ],
          );
        },
        separatorBuilder: (_, __) => const SizedBox(
          width: AppSizes.spaceBtwItems,
        ),
        itemCount: itemCount,
      ),
    );
  }
}
