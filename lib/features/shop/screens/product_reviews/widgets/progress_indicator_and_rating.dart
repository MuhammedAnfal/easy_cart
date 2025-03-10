import 'package:e_commerce/features/utils/constants/colors.dart';
import 'package:e_commerce/features/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class AppRatingProgressIndicator extends StatelessWidget {
  const AppRatingProgressIndicator({
    super.key,
    required this.text,
    required this.value,
  });
  final String text;
  final double value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: Text(text, style: Theme.of(context).textTheme.bodyMedium)),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: AppDeviceUtility.getScreenWidth(context) * 0.5,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 11,
              color: AppColors.grey,
              backgroundColor: AppColors.grey,
              valueColor: const AlwaysStoppedAnimation(AppColors.primary),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        )
      ],
    );
  }
}
