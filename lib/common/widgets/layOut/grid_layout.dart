import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AppGridLayout extends StatefulWidget {
  const AppGridLayout({super.key, required this.itemCount, this.mainAxisExtend = 288, required this.itemBuilder});

  final int itemCount;
  final double? mainAxisExtend;
  final Widget Function(BuildContext, int) itemBuilder;
  @override
  State<AppGridLayout> createState() => _AppGridLayoutState();
}

class _AppGridLayoutState extends State<AppGridLayout> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: widget.itemCount,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: AppSizes.gridViewSpacing,
          crossAxisSpacing: AppSizes.gridViewSpacing,
          mainAxisExtent: widget.mainAxisExtend,
          crossAxisCount: 2,
        ),
        itemBuilder: widget.itemBuilder);
  }
}
