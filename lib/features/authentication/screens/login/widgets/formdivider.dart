import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_function.dart';

class FormDevider extends StatelessWidget {
  const FormDevider({
    super.key,
     required this.dividerText,
  });
  final String dividerText;


  @override
  Widget build(BuildContext context) {
    final darkMode = AppHelperFunction.isDarkMode(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Divider(
          color: darkMode ? AppColors.darkGrey : AppColors.grey,
          indent: 60,
          endIndent: 5,
          thickness: 0.5,
        ),
        Text(dividerText.capitalize!,style: Theme.of(context).textTheme.labelMedium,),
        Divider(
          color: darkMode ? AppColors.darkGrey : AppColors.grey,
          indent: 5,
          endIndent: 60,
          thickness: 0.5,

        ),
      ],
    );
  }
}
