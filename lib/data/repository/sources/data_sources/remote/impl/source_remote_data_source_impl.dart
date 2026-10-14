//todo : source remote => impl
import 'package:injectable/injectable.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/api/model/sources/source_response.dart';
import 'package:news/data/repository/sources/data_sources/remote/source_remote_data_source.dart';
import 'package:news/data/repository/sources/repository/impl/source_repository_impl.dart';

//todo : impl => http
@Injectable(as:SourceRemoteDataSource )
class SourceRemoteDataSourceImpl  implements SourceRemoteDataSource{
  ApiManager apiManager ;
  SourceRemoteDataSourceImpl({required this.apiManager});
@override
  Future<SourceResponse> getSources( categoryId) {
      return apiManager.getSources(categoryId);
  }
}

//todo : impl => dio

class SourceRemoteDataSourceDioImpl implements SourceRemoteDataSource{
  @override
  Future<SourceResponse> getSources(String categoryId) {
    // TODO: implement getSources
    throw UnimplementedError();
  }
  
}
//todo : impl  => Retrofit
class  SourceRemoteDataSourceRetrofitImpl implements SourceRemoteDataSource{
  @override
  Future<SourceResponse> getSources(String categoryId) {
    // TODO: implement getSources
    throw UnimplementedError();
  }
  
}