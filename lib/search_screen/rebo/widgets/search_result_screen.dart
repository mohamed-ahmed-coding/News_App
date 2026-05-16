import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/home_screen/models/top_head_lines_model.dart';
import 'package:news_app/features/home_screen/widgets/article_card.dart';
import 'package:news_app/search_screen/rebo/serach_result_services.dart';
import 'package:news_app/styling/app_colors.dart';
import 'package:news_app/styling/app_text_styles.dart';

class SearchResultScreen extends StatelessWidget {
  final String query;
  const SearchResultScreen({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "seacrch_result".tr(),
          style: AppTextStyles.headingTitleStyle,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: SerachResultServices().searchItemByName(query),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            );
          }
          if (asyncSnapshot.hasError) {
            return Center(child: Text(asyncSnapshot.error.toString()));
          }
          if (asyncSnapshot.hasData) {
            ArticlesModel articlesModel = asyncSnapshot.data!;
            if (articlesModel.totalResults == 0) {
              return Center(child: Text('no_data_found'.tr()));
            }
            return Column(
              children: [
                SizedBox(height: 24.h),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: ListView.builder(
                      itemCount: articlesModel.articles?.length ?? 0,
                      itemBuilder: (context, index) {
                        return ArticleCard(
                          article: articlesModel.articles![index],
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          }
          return Center(child: Text('no_data_found'.tr()));
        },
      ),
    );
  }
}
