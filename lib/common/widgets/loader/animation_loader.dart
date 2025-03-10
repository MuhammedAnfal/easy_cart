import 'package:e_commerce/features/utils/constants/colors.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class AppAnimationLoaderWidget extends StatelessWidget {
  const AppAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });

  final String text;
  final animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      Lottie.asset(animation, width: MediaQuery.of(context).size.width * 0.6),
      const SizedBox(height: AppSizes.defaultSpace),
      Text(text, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
      const SizedBox(height: AppSizes.defaultSpace),
      showAction
          ? SizedBox(
              width: 250,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(backgroundColor: AppColors.dark),
                  onPressed: onActionPressed,
                  child: Text(actionText!)))
          : const SizedBox()
    ]));
  }

  //-- stop currently open loading
  //-- this method doesnt return anything
  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
