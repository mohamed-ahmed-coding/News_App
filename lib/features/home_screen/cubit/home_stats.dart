import 'package:news_app/features/home_screen/models/top_head_lines_model.dart';

abstract class HomeStats {}

class HomeStatsInitial extends HomeStats {}

class LoadingTopHeadLinesState extends HomeStats {}

class SuccessTopHeadLinesState extends HomeStats {
  final ArticlesModel topHeadLines;
  SuccessTopHeadLinesState(this.topHeadLines);
}

class ErrorTopHeadLinesState extends HomeStats {
  final String errorMessage;
  ErrorTopHeadLinesState(this.errorMessage);
}
