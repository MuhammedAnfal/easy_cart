import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_function.dart';


class AppPrivacyPolicy extends StatelessWidget {
  const AppPrivacyPolicy({super.key,});


  @override
  Widget build(BuildContext context) {
    final darkMode = AppHelperFunction.isDarkMode(context);

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "  ${AppTexts.iAgreeTo} ",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          TextSpan(
            text: '${AppTexts.privacyPolicy} ',
            style: Theme.of(context).textTheme.bodyMedium!.apply(
              color: darkMode ? AppColors.white : AppColors.primary,
              decoration: TextDecoration.underline,
              decorationColor: darkMode ? AppColors.white : AppColors.primary,
            ),
          ),
          TextSpan(
            text: "${AppTexts.and} ",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          TextSpan(
            text: "${AppTexts.termsofUse} ",
            style: Theme.of(context).textTheme.bodyMedium!.apply(
              color: darkMode ? AppColors.white : AppColors.primary,
              decoration: TextDecoration.underline,
              decorationColor: darkMode ? AppColors.white : AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
