import 'package:e_commerce/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce/features/utils/constants/colors.dart';
import 'package:e_commerce/features/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class AppChoiceChip extends StatelessWidget {
  const AppChoiceChip({super.key, required this.text, required this.selected, this.onSelected});

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = AppHelperFunction.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
          label: isColor ? const SizedBox() : Text(text),
          selected: selected,
          onSelected: onSelected,
          labelStyle: TextStyle(
            color: selected ? AppColors.white : null,
          ),
          avatar: isColor ? TcircularContainer(width: 50, height: 50, backgroudColor: AppHelperFunction.getColor(text)!) : null,
          shape: isColor ? const CircleBorder() : null,
          labelPadding: isColor ? const EdgeInsets.all(0) : null,
          padding: isColor ? const EdgeInsets.all(0) : null,
          backgroundColor: isColor ? AppHelperFunction.getColor(text)! : null,
          selectedColor: isColor ? AppHelperFunction.getColor(text)! : null),
    );
  }
}
