//todo : local ds =>interface

import 'package:news/api/model/news/News_response.dart';


abstract class NewsLocalDataSource {
  Future<NewsResponse?> getNews(String sourceId);
  Future<void> saveNews(NewsResponse newsResponse, String sourceId);
}