import 'package:e_commerce/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce/common/widgets/products/rating/rating_indicator.dart';
import 'package:e_commerce/features/utils/constants/colors.dart';
import 'package:e_commerce/features/utils/constants/image_strings.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:e_commerce/features/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunction.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(AppImages.userProfileimage1),
                ),
                const SizedBox(height: AppSizes.spaceBtwItems),
                Text('Jhon Doe', style: Theme.of(context).textTheme.titleLarge)
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),

            //-- review
          ],
        ),
        const SizedBox(height: AppSizes.spaceBtwItems),
        Row(
          children: [
            const AppRatingBarIndicator(rating: 4),
            const SizedBox(width: AppSizes.spaceBtwItems),
            Text('01 nov 2023', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: AppSizes.spaceBtwItems),
        const ReadMoreText(
          'The userface of the app is quite intuative , I was able to navigte and make purchase seamlessly,Well done',
          trimLines: 1,
          trimMode: TrimMode.Line,
          trimExpandedText: ' Show less',
          trimCollapsedText: 'Show more',
          moreStyle: TextStyle(fontSize: 14, color: AppColors.primary, fontWeight: FontWeight.bold),
          lessStyle: TextStyle(fontSize: 14, color: AppColors.primary, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: AppSizes.spaceBtwItems),

        //-- company  review
        TcircularContainer(
          backgroudColor: dark ? AppColors.darkerGrey : AppColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Easy Shop', style: Theme.of(context).textTheme.titleMedium),
                    Text('02 Nov 2023', style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(height: AppSizes.spaceBtwItems),
                const ReadMoreText(
                  'The userface of the app is quite intuative , I was able to navigte and make purchase seamlessly,Well done',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: ' Show less',
                  trimCollapsedText: 'Show more',
                  moreStyle: TextStyle(fontSize: 14, color: AppColors.primary, fontWeight: FontWeight.bold),
                  lessStyle: TextStyle(fontSize: 14, color: AppColors.primary, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: AppSizes.spaceBtwSections,
        )
      ],
    );
  }
}
