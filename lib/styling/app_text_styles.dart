import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/styling/app_colors.dart';

class AppTextStyles {
  static TextStyle headingTitleStyle = GoogleFonts.manrope(
    fontSize: 20.sp,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryColor,
  );

  static TextStyle subTitleStyle = GoogleFonts.manrope(
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.subTitleColor,
  );

  static TextStyle articleDescribtionStyle = GoogleFonts.manrope(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryColor,
  );

  static TextStyle caption = GoogleFonts.manrope(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor,
  );
}
