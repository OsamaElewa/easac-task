import 'package:flutter/cupertino.dart';

import '../../../core/utils/app_strings.dart';
import '../../../core/utils/app_styles.dart';


class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            children: [
              TextSpan(
                  text: AppStrings.alreadyHaveAnAccountText,
                  style: AppStyles.font13DarkBlueRegular
              ),

              TextSpan(
                  text: AppStrings.signUpText,
                  style: AppStyles.font13BlueSemiBold
              ),
            ]
        ));
  }
}
