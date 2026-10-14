//todo : interface => news remote ds
import 'package:news/api/model/news/News_response.dart';

abstract class NewsRemoteDataSource {
  Future<NewsResponse>getNewsBySourceId(String sourceId);
}
