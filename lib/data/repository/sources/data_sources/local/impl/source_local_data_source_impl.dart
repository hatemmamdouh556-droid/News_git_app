//todo : local ds => impl

import 'package:hive_ce/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:news/api/model/sources/source_response.dart';
import 'package:news/data/repository/sources/data_sources/local/source_local_data_source.dart';
@Injectable(as: SourceLocalDataSource)
class SourceLocalDataSourceImpl implements SourceLocalDataSource{
  @override
  Future<SourceResponse> getSources(String categoryId)async {
    //todo : open box
    var box  =await Hive.openBox('sources');
    //todo :get sources
    var data = box.get(categoryId); ///map => object
    //var data = SourceResponse.fromJson(box.get(categoryId)); ///map => object
    return data;
  }

  @override
  void saveSources(SourceResponse sourceResponse,String categoryId) async{
    // TODO:open box
    var box = await Hive.openBox('sources');
    // TODO:save box
    await box.put(categoryId, sourceResponse);
    // await box.put(categoryId, sourceResponse.toJson());
    //todo : close box
    await box.close();
  }
}