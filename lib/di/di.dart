// //todo : sourceView             => object SourceViewModel
// //todo : sourceViewModel        => object SourceRepository
// //todo : SourceRepository       => object SourceRemoteDataSource
// //todo : SourceRemoteDataSource       => object SourceLocalDataSource
// //todo : SourceRemoteDataSource => object ApiManger
//
// import 'package:news/api/api_manager.dart';
// import 'package:news/data/repository/news/data_sources/remote/impl/news_remote_data_source_impl.dart';
// import 'package:news/data/repository/news/data_sources/remote/news_remote_data_source.dart';
// import 'package:news/data/repository/news/repository/impl/news_repository_impl.dart';
// import 'package:news/data/repository/news/repository/news_repository.dart';
// import 'package:news/data/repository/sources/data_sources/local/impl/source_local_data_source_impl.dart';
// import 'package:news/data/repository/sources/data_sources/local/source_local_data_source.dart';
// import 'package:news/data/repository/sources/data_sources/remote/impl/source_remote_data_source_impl.dart';
// import 'package:news/data/repository/sources/data_sources/remote/source_remote_data_source.dart';
// import 'package:news/data/repository/sources/repository/impl/source_repository_impl.dart';
// import 'package:news/data/repository/sources/repository/source_repository.dart';
//
// SourceRepository injectSourceRepository(){
//   return SourceRepositoryImpl(remoteDataSource: injectSourceRemoteDataSource(),
//       localDataSource: injectSourceLocalDataSource());
//
//   }
// SourceLocalDataSource injectSourceLocalDataSource(){
//   return SourceLocalDataSourceImpl();
// }
// SourceRemoteDataSource injectSourceRemoteDataSource(){
//   return SourceRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
// }
//
// //todo : newsView             => object newsViewModel
// //todo : newsViewModel        => object newsRepository
// //todo : newsRepository       => object newsRemoteDataSource
// //todo : newsRemoteDataSource => object ApiManger
//
// NewsRepository injectNewsRepository(){
//     return NewsRepositoryImpl(remoteDataSource: injectNewsRemoteDataSource());
// }
// NewsRemoteDataSource injectNewsRemoteDataSource(){
//   return NewsRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
// }
