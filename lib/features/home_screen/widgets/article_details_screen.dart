import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/home_screen/models/top_head_lines_model.dart';
import 'package:news_app/styling/app_text_styles.dart';

class ArticleDetailsScreen extends StatelessWidget {
  final Article article;
  const ArticleDetailsScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.red,
        child: Stack(
          children: [
            SizedBox(
              width: 430.w,
              height: 250.h,
              child: CachedNetworkImage(
                imageUrl:
                    article.urlToImage ??
                    "https://img.freepik.com/free-vector/people-showcasing-different-types-ways-access-news_53876-43017.jpg?semt=ais_hybrid&w=740&q=80",
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: 200.h,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.8,
                padding: EdgeInsets.only(top: 24.h, left: 24.w, right: 24.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24.r),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        article.title ?? '',
                        style: AppTextStyles.headingTitleStyle,
                      ),
                      SizedBox(height: 8.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${article.author ?? ''}${DateFormat('yyyy-MM-dd - kk:mm').format(article.publishedAt ?? DateTime.now())}",
                          style: AppTextStyles.subTitleStyle,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        article.content ??
                            'lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                        style: AppTextStyles.articleDescribtionStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
