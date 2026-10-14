//todo : source view model => cubit
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/api/model/sources/cubit/source_states.dart';
import 'package:news/api/model/sources/source.dart';
import 'package:news/data/repository/sources/data_sources/remote/impl/source_remote_data_source_impl.dart';
import 'package:news/data/repository/sources/data_sources/remote/source_remote_data_source.dart';
import 'package:news/data/repository/sources/repository/impl/source_repository_impl.dart';
import 'package:news/data/repository/sources/repository/source_repository.dart';
@injectable
class SourceViewModel extends Cubit<SourceStates>{
   SourceRepository sourceRepository;
  SourceViewModel({required this.sourceRepository}):super(SourceLoadingStates());

  //todo : hold data - handel lodic

    // List<Source>? sourceList;
    // String? errorMessage;
    void getSources(String categoryId)async{
      try{
        //todo: Loading
        emit(SourceLoadingStates());
        var response =await sourceRepository.getSources(categoryId);
        if(response.status == 'error'){
          //todo error
          emit(SourceErrorStates(errorMessage: response.massage!));
          return;
        }
        if(response.status=='ok'){
          //todo: success
          emit(SourceSuccessStates(sourceList: response.sources ??[]));
          return;
        }
      }catch(e){
        //todo: error
        emit(SourceErrorStates(errorMessage:e.toString() ));

      }
    }
}