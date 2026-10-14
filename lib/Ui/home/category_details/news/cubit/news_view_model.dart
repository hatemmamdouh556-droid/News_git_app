//todo : news view model
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news/Ui/home/category_details/news/cubit/news_states.dart';
import 'package:news/data/repository/news/repository/news_repository.dart';
@injectable
class NewsViewModel extends Cubit<NewsStates> {
  NewsRepository newsRepository;
  NewsViewModel({required this.newsRepository}) : super(NewsLoadingStates());

  void getNewsBySoursId(String categoryId) async {
    try {
      emit(NewsLoadingStates());
      var response = await newsRepository.getNewsBySourceId(categoryId);
      if (isClosed) return;

      if (response == null) {

        emit(NewsErrorStates(
            errorMessage: 'No internet connection and no cached news'));
        return;
      }

      if (response.status == 'error') {
        emit(NewsErrorStates(
            errorMessage: response.message ?? 'Something went wrong'));
      } else if (response.status == 'ok') {
        emit(NewsSuccessStates(newsList: response.articles ?? []));
      }
    } catch (e) {
      if (isClosed) return;
      emit(NewsErrorStates(errorMessage: e.toString()));
    }
  }
}