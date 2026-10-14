//todo : news repo => impl

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:news/api/model/news/News_response.dart';
import 'package:news/data/repository/news/data_sources/local/news_local_data_source.dart';
import 'package:news/data/repository/news/data_sources/remote/news_remote_data_source.dart';
import 'package:news/data/repository/news/repository/news_repository.dart';
@Injectable(as: NewsRepository)
class NewsRepositoryImpl implements NewsRepository{
  NewsRemoteDataSource remoteDataSource;
  NewsLocalDataSource localDataNews;
  NewsRepositoryImpl({required this.remoteDataSource,required this.localDataNews});
  @override
  Future<NewsResponse?> getNewsBySourceId(String sourceId) async {
    final List<ConnectivityResult> connectivityResult =
    await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var newsResponse = await remoteDataSource.getNewsBySourceId(sourceId);
      if (newsResponse != null) {
        await localDataNews.saveNews(newsResponse, sourceId);  // await + null check
      }
      return newsResponse;
    } else {
      var newsResponse = await localDataNews.getNews(sourceId);
      return newsResponse;
    }
  }

}