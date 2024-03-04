import 'package:flutter/cupertino.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';

class WelcomeBackSection extends StatelessWidget {
  const WelcomeBackSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppStrings.welcomeBackText,style: AppStyles.font24BlueBold,),
          verticalSpace(8),
          Text(AppStrings.welcomeBackSecText,style: AppStyles.font14GreyRegular,),
        ],
      ),
    );
  }
}
