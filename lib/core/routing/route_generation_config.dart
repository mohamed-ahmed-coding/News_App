import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routing/app_routes.dart';
import 'package:news_app/features/home_screen/cubit/home_cubit.dart';
import 'package:news_app/features/home_screen/home_screen.dart';
import 'package:news_app/features/home_screen/models/top_head_lines_model.dart';
import 'package:news_app/features/home_screen/widgets/article_details_screen.dart';
import 'package:news_app/search_screen/rebo/widgets/search_result_screen.dart';

class RouteGenerationConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.homeScreen,
    routes: [
      GoRoute(path: AppRoutes.homeScreen,
        name: AppRoutes.homeScreen,
        builder: (context, state) {
        return BlocProvider(
          create: (context) => HomeCubit(),
          child: HomeScreen());
      }),
      GoRoute(path: AppRoutes.searchScreen,
        name: AppRoutes.searchScreen,
        builder: (context, state) {
        return Container();
      }),
      GoRoute(path: AppRoutes.searchResultScreen,
        name: AppRoutes.searchResultScreen,
        builder: (context, state) {
          String query = state.extra as String;
        return SearchResultScreen(query: query);
      }),
      GoRoute(path: AppRoutes.articleDetailsScreen,
        name: AppRoutes.articleDetailsScreen,
        builder: (context, state) {
        Article article = state.extra as Article;
        return ArticleDetailsScreen(article: article);
      }),
      ]);
}