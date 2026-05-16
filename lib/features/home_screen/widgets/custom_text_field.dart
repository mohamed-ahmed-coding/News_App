import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/styling/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final double? width;
  final String? hintText;
  final Widget? suffixIcon;
  final bool? isPassword;
  final void Function(String)? onSubmitted;

  const CustomTextField({
    super.key,
    this.width,
    this.hintText,
    this.suffixIcon,
    this.isPassword,
    required bool obscureText,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 331.w,
      child: TextField(
        autofocus: false,
        cursorColor: AppColors.primaryColor,
        obscureText: isPassword ?? false,
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          hintText: hintText ?? "",
          hintStyle: TextStyle(
            color: const Color(0xff8391A1),
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 18.w,
            vertical: 18.h,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(color: AppColors.softBorder, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(
              color: AppColors.accentColor,
              width: 1.4,
            ),
          ),
          filled: true,
          fillColor: AppColors.card,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
