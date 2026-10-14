//todo : impl  => news remote ds


//todo : http
import 'package:injectable/injectable.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/api/model/news/News_response.dart';
import 'package:news/data/repository/news/data_sources/remote/news_remote_data_source.dart';
@Injectable(as: NewsRemoteDataSource)
class NewsRemoteDataSourceImpl implements NewsRemoteDataSource{
  ApiManager apiManager;
  NewsRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<NewsResponse> getNewsBySourceId(String sourceId) {
    return apiManager.getNewsBySourceId(sourceId);
  }
}