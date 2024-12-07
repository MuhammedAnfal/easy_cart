
import 'package:flutter/cupertino.dart';

import '../../../../../common/widgets/image_text_widget/popular_categories_home_screen.dart';
import '../../../../utils/constants/image_strings.dart';

class AppHomeScreenCategories extends StatelessWidget {
  const AppHomeScreenCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return AppPopularCategoriesWidget(
            title: 'shoe',
            image: AppImages.deliveredEmailIllustration,
            ontap: () {},
          );
        },
      ),
    );
  }
}