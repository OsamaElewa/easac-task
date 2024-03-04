import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';

class SocialMediaIcon extends StatelessWidget {
  const SocialMediaIcon({super.key, required this.iconString});

  final SvgPicture iconString;
  @override
  Widget build(BuildContext context) {
    return Container(
          height: 46.h,
          width: 46.h,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
              color: AppColors.lighterGrey
          ),
      child: iconString,
        );
  }
}
