//todo : source repo => impl
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:news/api/model/sources/source_response.dart';
import 'package:news/data/repository/sources/data_sources/local/source_local_data_source.dart';
import 'package:news/data/repository/sources/data_sources/remote/source_remote_data_source.dart';
import 'package:news/data/repository/sources/repository/source_repository.dart';
@Injectable(as: SourceRepository)
class SourceRepositoryImpl implements SourceRepository{

  SourceRemoteDataSource remoteDataSource;
  SourceLocalDataSource localDataSource;
  SourceRepositoryImpl({required this.remoteDataSource,
  required this.localDataSource});
  @override
  Future<SourceResponse> getSources(String categoryId)async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      //todo :internet => remote ds
      //todo : get sources
      var sourceResponse = await remoteDataSource.getSources(categoryId);
      //todo : save source in local ds
      localDataSource.saveSources(sourceResponse,categoryId);
      return sourceResponse;
    }else {
      //todo : no internet => local ds
      var sourceResponse=await  localDataSource.getSources(categoryId);
           return sourceResponse;
    }



  }
}