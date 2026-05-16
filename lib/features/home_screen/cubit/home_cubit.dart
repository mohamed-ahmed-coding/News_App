import 'package:bloc/bloc.dart';
import 'package:news_app/features/home_screen/cubit/home_stats.dart';
import 'package:news_app/features/home_screen/rebo/home_rebo.dart';

class HomeCubit extends Cubit<HomeStats> {
  HomeCubit() : super(HomeStatsInitial());

  final HomeRebo homeRebo = HomeRebo();

  Future<void> getTopHeadLines() async {
    emit(LoadingTopHeadLinesState());
    try {
      final response = await homeRebo.getTopHeadlinesArticle();
      emit(SuccessTopHeadLinesState(response));
    } catch (e) {
      emit(ErrorTopHeadLinesState(e.toString()));
    }
  }
}
