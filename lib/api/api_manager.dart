import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api/api_constant.dart';
import 'package:news/api/api_end_point.dart';
import 'package:news/api/model/news/News_response.dart';
import 'package:news/api/model/sources/source_response.dart';

class ApiManager {
  /// https://newsapi.org/v2/top-headlines/sources?apiKey=bc338605ee4f47f58e35d024131386cd
  static Future<SourceResponse> getSources(String categoryId) async{
    try{
      Uri url = Uri.https(ApiConstant.baseUrl, ApiEndPoint.sourceApi, {
        'apikey': ApiConstant.apiKey,
        'Category' : categoryId
      });

      var response = await http.get(url);
      var responseBody = response.body ; ///String
      ///String => json
      var json =jsonDecode(responseBody);
      ///json => object
      return SourceResponse.fromJson(json);
    }catch(e){
      rethrow ;
    }

  }

  ///https://newsapi.org/v2/everything?q=bitcoin&apiKey=bc338605ee4f47Future<NewsResponse>35d024131386cd
  static Future<NewsResponse> getNewsBySourceId(String sourceId)async{
    try{
      Uri url = Uri.https(ApiConstant.baseUrl,
          ApiEndPoint.newsApi,
          {
            'apiKey' : ApiConstant.apiKey,
            'sources' :sourceId,
          }
      );
      var response = await http.get(url);
      var responseBody =response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    }catch(e){
      rethrow;
    }


  }
}
