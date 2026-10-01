import 'package:dio/dio.dart';
import 'package:news/api/api_end_point.dart';
import 'package:news/api/dio/dio_interceptor.dart';
import 'package:news/api/model/news/News_response.dart';
import 'package:news/api/model/sources/source_response.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../api_constant.dart';

/// https://newsapi.org/v2/top-headlines/sources?apiKey=bc338605ee4f47f58e35d024131386cd
class DioManager {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://newsapi.org',
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 3),
      // queryParameters: {
      //   'apiKey': ApiConstant.apiKey},
      headers: {
        'X-Api-Key': ApiConstant.apiKey
      }
    ),
  );
  DioManager(){
    dio.interceptors.add(DioInterceptor());
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,

    ));
  }

   Future<SourceResponse> getSources(String categoryId) async {
    try {
      var response = await dio.get(
        ApiEndPoint.sourceApi,
        queryParameters: {
           'Category': categoryId,
        },
      );
      return SourceResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  /*GET https://newsapi.org/v2/everything?q=bitcoin&apiKey=bc338605ee4f47f58e35d024131386cd
*/
   Future<NewsResponse> getNewsBySourceId(String sourceId) async {
    try {
      var response = await dio.get(
        ApiEndPoint.newsApi,
        queryParameters: {'sources': sourceId},
      );
      return NewsResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
