//todo : interface => news repo
import '../../../../api/model/news/News_response.dart';

abstract class NewsRepository {
  Future<NewsResponse?> getNewsBySourceId(String sourceId);
}
