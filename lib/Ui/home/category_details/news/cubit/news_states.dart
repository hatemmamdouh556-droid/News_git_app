//todo : news states

//todo : initial , Loading , error , success

import 'package:news/api/model/news/Articles.dart';

abstract class NewsStates {}

class NewsInitialStates extends NewsStates {}
class NewsLoadingStates extends NewsStates {}
class NewsErrorStates extends NewsStates {
  String errorMessage;
  NewsErrorStates({required this.errorMessage});
}
class NewsSuccessStates extends NewsStates {
  List<News> newsList ;
  NewsSuccessStates({required this.newsList});
}