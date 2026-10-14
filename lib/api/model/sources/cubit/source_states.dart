//todo : source state
//todo :loading ,success,error,initial
import 'package:news/api/model/sources/source.dart';

abstract class SourceStates {}//todo : parent
class SourceInitialStates extends SourceStates {}
class SourceLoadingStates extends SourceStates {}
class SourceErrorStates extends SourceStates {
  String errorMessage;
  SourceErrorStates({required this.errorMessage});
}
class SourceSuccessStates extends SourceStates {
  List<Source> sourceList;
  SourceSuccessStates({required this.sourceList});
}