import 'package:e_commerce/features/utils/constants/colors.dart';
import 'package:e_commerce/features/utils/constants/text_strings.dart';
import 'package:e_commerce/features/utils/device/device_utility.dart';
import 'package:e_commerce/features/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../common/widgets/custom_shapes/curved_edges/curved_edge_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppCurvedEdgeWidget(
              child: Container(
                color: AppColors.primary,
                child: SizedBox(
                  height: AppDeviceUtility.getScreenHeight() * 0.44,
                  child: Stack(
                    children: [
                      Positioned(
                        top: -150,
                        right: -250,
                        child: TcircularContainer(
                          backgroudColor: AppColors.white.withOpacity(0.1),
                          height: AppDeviceUtility.getScreenHeight() * 0.44,
                          width: AppDeviceUtility.getScreenWidth(context) * 0.95,
                        ),
                      ),
                      Positioned(
                        top: 100,
                        right: -300,
                        child: TcircularContainer(
                          backgroudColor: AppColors.white.withOpacity(0.1),
                          height: AppDeviceUtility.getScreenHeight() * 0.44,
                          width: AppDeviceUtility.getScreenWidth(context) * 0.95,
                        ),
                      ),
                      AppBar(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppTexts.homeAppBarTitle,
                              style: Theme.of(context).textTheme.labelMedium!.apply(color: AppColors.grey),
                            ),
                            Text(
                              AppTexts.homeAppBarSubTitle,
                              style: Theme.of(context).textTheme.headlineSmall!.apply(color: AppColors.white),
                            ),
                          ],
                        ),
                        actions: [
                          Stack(
                            children: [
                              IconButton(onPressed: () {}, icon: const Icon(Iconsax.shopping_bag)),
                              Positioned(
                                top: AppHelperFunction.screenHeight() * 0.01,
                                left: AppHelperFunction.screenHeight() * 0.01,
                                child: Container(
                                  height: AppHelperFunction.screenHeight() * 0.025,
                                  width: AppHelperFunction.screenWidth() * 0.05,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(AppHelperFunction.screenWidth()* 0.03),
                                    color: AppColors.black,

                                  ),
                                ),
                              )
                            ],
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
