import 'package:hive_ce/hive_ce.dart';
import 'package:news/api/model/sources/source.dart';
import 'package:news/api/model/sources/source_response.dart';


@GenerateAdapters([AdapterSpec<SourceResponse>(),
AdapterSpec<Source>()])
part 'hive_adapters.g.dart';
