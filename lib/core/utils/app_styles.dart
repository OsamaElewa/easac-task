import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';
import 'app_font_weight.dart';

abstract class AppStyles {
  static final font24Black700Weight = TextStyle(
    fontSize: 24.sp,
    color: AppColors.black,
    fontWeight: AppFontWeight.semiBold
  );

  static final font24BlueBold = TextStyle(
      fontSize: 24.sp,
      color: AppColors.primary,
      fontWeight: AppFontWeight.bold
  );

  static final font14GreyRegular = TextStyle(
      fontSize: 14.sp,
      color: AppColors.grey,
      fontWeight: AppFontWeight.regular
  );

  static final font13DarkBlueMedium = TextStyle(
      fontSize: 13.sp,
      color: AppColors.darkBlue,
      fontWeight: AppFontWeight.medium
  );

  static final font13DarkBlueRegular = TextStyle(
      fontSize: 13.sp,
      color: AppColors.darkBlue,
      fontWeight: AppFontWeight.regular
  );

  static final font13BlueSemiBold = TextStyle(
      fontSize: 13.sp,
      color: AppColors.primary,
      fontWeight: AppFontWeight.semiBold
  );


  static final font32BlueBold = TextStyle(
      fontSize: 32.sp,
      color: AppColors.primary,
      fontWeight: AppFontWeight.bold
  );

  static final font13GreyRegular = TextStyle(
      fontSize: 13.sp,
      color: AppColors.grey,
      fontWeight: FontWeight.normal,
  );

  static final font16WhiteRegular = TextStyle(
    fontSize: 16.sp,
    color: AppColors.white,
    fontWeight: FontWeight.normal,
  );
}
