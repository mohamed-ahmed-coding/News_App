// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/constants/constants.dart';
import 'package:news_app/core/routing/app_routes.dart';
import 'package:news_app/features/home_screen/cubit/home_cubit.dart';
import 'package:news_app/features/home_screen/cubit/home_stats.dart';
import 'package:news_app/features/home_screen/models/top_head_lines_model.dart';
import 'package:news_app/features/home_screen/widgets/article_card.dart';
import 'package:news_app/features/home_screen/widgets/custom_category_item.dart';
import 'package:news_app/features/home_screen/widgets/top_headline_item.dart';
import 'package:news_app/search_screen/rebo/widgets/search_textfield_widget.dart';
import 'package:news_app/styling/app_colors.dart';
import 'package:news_app/styling/app_text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getTopHeadLines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(128.h),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff152B4A), Color(0xff1E3F73)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(26)),
          ),
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 16.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'explore'.tr(),
                          style: AppTextStyles.headingTitleStyle.copyWith(
                            color: Colors.white,
                            fontSize: 26.sp,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          "Curated headlines, refreshed hourly",
                          style: AppTextStyles.subTitleStyle.copyWith(
                            color: Colors.white.withOpacity(.78),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SearchTextfieldWidget(),
                  Container(
                    margin: EdgeInsets.only(left: 4.w),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.12),
                      borderRadius: BorderRadius.circular(14.r),
                      border: Border.all(color: Colors.white.withOpacity(.2)),
                    ),
                    child: IconButton(
                      onPressed: () {
                        if (context.locale.languageCode == 'en') {
                          context.setLocale(const Locale('ar'));
                        } else {
                          context.setLocale(const Locale('en'));
                        }
                        Constants.lang = context.locale.languageCode;
                      },
                      icon: const Icon(Icons.language, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: BlocBuilder<HomeCubit, HomeStats>(
        builder: (context, state) {
          if (state is LoadingTopHeadLinesState) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            );
          }
          if (state is ErrorTopHeadLinesState) {
            return Center(child: Text(state.errorMessage));
          }
          if (state is SuccessTopHeadLinesState) {
            ArticlesModel articlesModel = state.topHeadLines;
            if (articlesModel.totalResults == 0) {
              return Center(child: Text('no_data_found'.tr()));
            }
            return Column(
              children: [
                SizedBox(height: 12.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.w),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.card,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.02),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: SizedBox(
                      height: 44.h,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.only(start: 6.w),
                            child: CustomCategoryItem(
                              title: "travel".tr(),
                              onTap: () {
                                GoRouter.of(context).pushNamed(
                                  AppRoutes.searchResultScreen,
                                  extra: "travel".tr(),
                                );
                              },
                            ),
                          ),
                          CustomCategoryItem(
                            title: "technology".tr(),
                            onTap: () {
                              GoRouter.of(context).pushNamed(
                                AppRoutes.searchResultScreen,
                                extra: "technology".tr(),
                              );
                            },
                          ),
                          CustomCategoryItem(
                            title: "entertainment".tr(),
                            onTap: () {
                              GoRouter.of(context).pushNamed(
                                AppRoutes.searchResultScreen,
                                extra: "entertainment".tr(),
                              );
                            },
                          ),
                          CustomCategoryItem(
                            title: "business".tr(),
                            onTap: () {
                              GoRouter.of(context).pushNamed(
                                AppRoutes.searchResultScreen,
                                extra: "business".tr(),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.w),
                  child: Column(
                    children: [
                      TopheadlineItem(
                        imageUrl: articlesModel.articles![0].urlToImage,
                        // imageUrl: "https://media.gq-magazine.co.uk/photos/68ca8464dd21716162dbe724/16:9/w_2560%2Cc_limit/iPhone-17-Pro-HP.jpg",
                        title: articlesModel.articles![0].title ?? "",
                        authorname:
                            articlesModel.articles![0].author ?? "Unknown",
                        date: DateFormat('yyyy-MM-dd - kk:mm').format(
                          articlesModel.articles![0].publishedAt ??
                              DateTime.now(),
                        ),
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22.w),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: articlesModel.articles!.length,
                      itemBuilder: (context, index) {
                        return ArticleCard(
                          article: articlesModel.articles![index],
                          index: index,
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
