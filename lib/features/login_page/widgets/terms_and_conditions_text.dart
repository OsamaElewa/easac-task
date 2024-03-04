
import 'package:flutter/cupertino.dart';

import '../../../core/utils/app_strings.dart';
import '../../../core/utils/app_styles.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText ({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
    text: TextSpan(
    children: [
      TextSpan(
      text: AppStrings.privacyAndPolicyText1,
      style: AppStyles.font13GreyRegular
      ),

      TextSpan(
          text: AppStrings.privacyAndPolicyText2,
          style: AppStyles.font13DarkBlueMedium
      ),

      TextSpan(
          text: AppStrings.privacyAndPolicyText3,
          style: AppStyles.font13GreyRegular
      ),

      TextSpan(
          text: AppStrings.privacyAndPolicyText4,
          style: AppStyles.font13DarkBlueMedium
      ),
  ]
    ));
  }
}
