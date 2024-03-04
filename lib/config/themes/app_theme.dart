import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_constants.dart';
import '../../core/utils/app_styles.dart';


ThemeData appTheme() {
  return ThemeData(
      primarySwatch: Colors.blue,
      useMaterial3: false,
      unselectedWidgetColor: AppColors.grey,
      //textTheme: GoogleFonts.montserratTextTheme(),
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.white,
  );
}
