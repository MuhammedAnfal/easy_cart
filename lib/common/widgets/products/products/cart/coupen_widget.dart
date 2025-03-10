import 'package:e_commerce/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce/features/utils/constants/colors.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:e_commerce/features/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class AppCoupenCode extends StatelessWidget {
  const AppCoupenCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunction.isDarkMode(context);
    return TcircularContainer(
      showBorder: true,
      backgroudColor: dark ? AppColors.black : AppColors.white,
      padding: const EdgeInsets.only(top: AppSizes.sm, bottom: AppSizes.sm, right: AppSizes.sm, left: AppSizes.md),
      child: Row(
        children: [
          //-- textfield
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Have a promocode? Enter here',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          //-- button
          SizedBox(
              width: 80,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: dark ? AppColors.white.withOpacity(0.5) : AppColors.black.withOpacity(0.5),
                      backgroundColor: Colors.grey.withOpacity(0.2),
                      side: BorderSide(color: Colors.grey.withOpacity(0.1))),
                  onPressed: () {},
                  child: const Text('Apply')))
        ],
      ),
    );
  }
}
