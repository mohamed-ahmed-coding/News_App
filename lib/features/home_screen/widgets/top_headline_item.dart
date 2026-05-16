// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/styling/app_text_styles.dart';
import 'package:news_app/styling/app_colors.dart';

class TopheadlineItem extends StatelessWidget {
  final String title;
  final String authorname;
  final String? imageUrl;
  final String date;
  const TopheadlineItem({
    super.key,
    required this.title,
    required this.authorname,
    this.imageUrl,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.96, end: 1),
      duration: const Duration(milliseconds: 420),
      curve: Curves.easeOutBack,
      builder: (context, value, child) => Transform.scale(
        scale: value,
        alignment: Alignment.center,
        child: child,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 24,
              offset: const Offset(0, 14),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl:
                    imageUrl ??
                    "https://img.freepik.com/free-vector/people-showcasing-different-types-ways-access-news_53876-43017.jpg?semt=ais_hybrid&w=740&q=80",
                height: 240.h,
                width: double.infinity,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.05),
                        AppColors.overlayDark,
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 16.w,
                right: 16.w,
                bottom: 16.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.accentColor.withOpacity(.9),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        "Top headline",
                        style: AppTextStyles.caption.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.headingTitleStyle.copyWith(
                        color: Colors.white,
                        fontSize: 22.sp,
                        height: 1.2,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "$authorname • $date",
                      style: AppTextStyles.subTitleStyle.copyWith(
                        color: Colors.white.withOpacity(.85),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
