// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:flutter/material.dart' as _i409;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../api/api_manager.dart' as _i1047;
import '../api/model/sources/cubit/source_view_model.dart' as _i90;
import '../api/model/sources/source.dart' as _i648;
import '../data/repository/news/data_sources/local/impl/news_local_data_source_impl.dart'
    as _i393;
import '../data/repository/news/data_sources/local/news_local_data_source.dart'
    as _i851;
import '../data/repository/news/data_sources/remote/impl/news_remote_data_source_impl.dart'
    as _i852;
import '../data/repository/news/data_sources/remote/news_remote_data_source.dart'
    as _i833;
import '../data/repository/news/repository/impl/news_repository_impl.dart'
    as _i1060;
import '../data/repository/news/repository/news_repository.dart' as _i912;
import '../data/repository/sources/data_sources/local/impl/source_local_data_source_impl.dart'
    as _i313;
import '../data/repository/sources/data_sources/local/source_local_data_source.dart'
    as _i316;
import '../data/repository/sources/data_sources/remote/impl/source_remote_data_source_impl.dart'
    as _i868;
import '../data/repository/sources/data_sources/remote/source_remote_data_source.dart'
    as _i567;
import '../data/repository/sources/repository/impl/source_repository_impl.dart'
    as _i250;
import '../data/repository/sources/repository/source_repository.dart' as _i522;
import '../Ui/home/category_details/news/cubit/news_view_model.dart' as _i685;
import '../Ui/home/category_details/news/news_widget.dart' as _i823;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.factory<_i316.SourceLocalDataSource>(
      () => _i313.SourceLocalDataSourceImpl(),
    );
    gh.factory<_i833.NewsRemoteDataSource>(
      () => _i852.NewsRemoteDataSourceImpl(apiManager: gh<_i1047.ApiManager>()),
    );
    gh.factory<_i567.SourceRemoteDataSource>(
      () =>
          _i868.SourceRemoteDataSourceImpl(apiManager: gh<_i1047.ApiManager>()),
    );
    gh.factory<_i851.NewsLocalDataSource>(
      () => _i393.NewsLocalDataSourceImpl(),
    );
    gh.factory<_i823.NewsWidget>(
      () => _i823.NewsWidget(key: gh<_i409.Key>(), source: gh<_i648.Source>()),
    );
    gh.factory<_i522.SourceRepository>(
      () => _i250.SourceRepositoryImpl(
        remoteDataSource: gh<_i567.SourceRemoteDataSource>(),
        localDataSource: gh<_i316.SourceLocalDataSource>(),
      ),
    );
    gh.factory<_i912.NewsRepository>(
      () => _i1060.NewsRepositoryImpl(
        remoteDataSource: gh<_i833.NewsRemoteDataSource>(),
        localDataNews: gh<_i851.NewsLocalDataSource>(),
      ),
    );
    gh.factory<_i90.SourceViewModel>(
      () =>
          _i90.SourceViewModel(sourceRepository: gh<_i522.SourceRepository>()),
    );
    gh.factory<_i685.NewsViewModel>(
      () => _i685.NewsViewModel(newsRepository: gh<_i912.NewsRepository>()),
    );
    return this;
  }
}
