import 'package:flutter/material.dart';

class AppSectionHeading extends StatelessWidget {
  const AppSectionHeading({
    super.key,
    this.textColor,
    this.showActionButton = true,
    required this.title,
    this.buttonTitle = 'View all',
    this.onPressed,
    this.subTitle = ''
  });

  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall!.apply(color: textColor),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
             subTitle.toString() ,
              style: Theme.of(context).textTheme.labelMedium!.apply(color: textColor),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),

        if (showActionButton) TextButton(onPressed: onPressed, child: Text(buttonTitle))
      ],
    );
  }
}
