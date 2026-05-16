import 'dart:developer';
import 'package:news_app/constants/constants.dart';
import 'package:news_app/core/networking/api_endpoints.dart';
import 'package:news_app/core/networking/dio_helper.dart';
import 'package:news_app/features/home_screen/models/top_head_lines_model.dart';

class HomeRebo {
  Future<ArticlesModel> getTopHeadlinesArticle() async {
    try {
      final response = await DioHelper.getRequest(
        endPoint: ApiEndpoints.topHeadlines,
        query: {"apiKey": Constants.newsApiKey, "country": "us"},
      );
      if (response?.statusCode == 200) {
        ArticlesModel articlesModel = ArticlesModel.fromJson(response!.data);
        log(articlesModel.totalResults.toString());
        return articlesModel;
      }
    } catch (e) {
      log(e.toString());
      return Future.error(e.toString());
    }
    return ArticlesModel();
  }
}
