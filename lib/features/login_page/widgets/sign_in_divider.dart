
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/utils/app_colors.dart';

class SignInDivider extends StatelessWidget {
  const SignInDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 2,
              width: 150,
              decoration: const BoxDecoration(
                color: AppColors.grey,
              ),
            ),
          ),
          horizontalSpace(10),
          const Text('or sign in with'),
          horizontalSpace(10),
          Expanded(
            child: Container(
              height: 2,
              width: 150,
              decoration: const BoxDecoration(
                color: AppColors.grey,

              ),
            ),
          ),
        ],
      ),
    );
  }
}
