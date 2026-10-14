//todo : local ds => impl

import 'dart:convert';
import 'package:hive_ce/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:news/api/model/news/News_response.dart';
import '../news_local_data_source.dart';

@Injectable(as: NewsLocalDataSource)
class NewsLocalDataSourceImpl implements NewsLocalDataSource {
  static const String _boxName = 'news_cache';

  @override
  Future<NewsResponse?> getNews(String sourceId) async {
    final box = await Hive.openBox<String>(_boxName);
    final jsonString = box.get('news_$sourceId');
    if (jsonString == null) return null;
    return NewsResponse.fromJson(jsonDecode(jsonString));
  }

  @override
  Future<void> saveNews(NewsResponse newsResponse, String sourceId) async {
    final box = await Hive.openBox<String>(_boxName);
    await box.put('news_$sourceId', jsonEncode(newsResponse.toJson()));
  }
}
  // @override
  // Future<SourceResponse> getSources(String categoryId)async {
  //   //todo : open box
  //   var box  =await Hive.openBox('sources');
  //   //todo :get sources
  //   var data = box.get(categoryId); ///map => object
  //   //var data = SourceResponse.fromJson(box.get(categoryId)); ///map => object
  //   return data;
  // }
  //
  // @override
  // void saveSources(SourceResponse sourceResponse,String categoryId) async{
  //   // TODO:open box
  //   var box = await Hive.openBox('sources');
  //   // TODO:save box
  //   await box.put(categoryId, sourceResponse);
  //   // await box.put(categoryId, sourceResponse.toJson());
  //   //todo : close box
  //   await box.close();
  // }
