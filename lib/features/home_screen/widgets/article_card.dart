// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routing/app_routes.dart';
import 'package:news_app/features/home_screen/models/top_head_lines_model.dart';
import 'package:news_app/styling/app_text_styles.dart';
import 'package:news_app/styling/app_colors.dart';

class ArticleCard extends StatelessWidget {
  final Article article;
  final int index;
  const ArticleCard({super.key, required this.article, this.index = 0});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(
          context,
        ).pushNamed(AppRoutes.articleDetailsScreen, extra: article);
      },
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 26, end: 0),
        duration: Duration(milliseconds: 420 + (index * 22)),
        curve: Curves.easeOutCubic,
        builder: (context, value, child) => Opacity(
          opacity: (1 - (value / 26)).clamp(0, 1),
          child: Transform.translate(offset: Offset(0, value), child: child),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 18.0),
          child: Container(
            padding: EdgeInsets.all(14.w),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: AppColors.softBorder),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 12,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.title ?? '',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.headingTitleStyle.copyWith(
                          height: 1.3,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: AppColors.accentColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: Text(
                              '${article.author ?? 'Unknown'}  ·  ${DateFormat('yyyy-MM-dd').format(article.publishedAt ?? DateTime.now())}',
                              style: AppTextStyles.subTitleStyle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Read article",
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.accentColor,
                            ),
                          ),
                          const Icon(
                            Icons.north_east,
                            size: 16,
                            color: AppColors.accentColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 14.w),
                SizedBox(
                  width: 112.w,
                  height: 92.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: CachedNetworkImage(
                      imageUrl:
                          article.urlToImage ??
                          "https://img.freepik.com/free-vector/people-showcasing-different-types-ways-access-news_53876-43017.jpg?semt=ais_hybrid&w=740&q=80",
                      height: 210.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
