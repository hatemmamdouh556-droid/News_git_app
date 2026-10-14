//todo : local ds =>interface

import 'package:news/api/model/sources/source_response.dart';
import 'package:news/data/repository/sources/repository/source_repository.dart';

abstract  class SourceLocalDataSource {
  Future<SourceResponse>getSources(String categoryId);
  //todo : save data
void saveSources(SourceResponse sourceResponse , String categoryId);
}