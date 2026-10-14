import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Ui/home/category_details/category_details.dart';
import 'package:news/Ui/home/category_details/sources/source_tab.dart';
import 'package:news/Ui/widget/main_error_widget.dart';
import 'package:news/Ui/widget/main_loading_widget.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/api/model/category/category.dart';
import 'package:news/api/model/sources/cubit/source_states.dart';
import 'package:news/api/model/sources/cubit/source_view_model.dart';
import 'package:news/di/di.dart';
import 'package:news/di/di_inject.dart';


class CategoryDetails extends StatefulWidget {

  final Category category;

  CategoryDetails({super.key, required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  SourceViewModel viewModel = getIt ();
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SourceViewModel, SourceStates>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is SourceSuccessStates){
          //todo :success
          var sourcesList = state.sourceList;
          return SourceTab(sourcesList: sourcesList);

        }else if(state is SourceErrorStates){
          //todo :Error
          return MainErrorWidget(
              errorMessage: state.errorMessage,
              onPressed: (){
                viewModel.getSources(widget.category.id);
              }
          );
        }else {
          //todo :Loading
          return MainLoadingWidget() ;

        }
        //return Container();
      },);
    //   FutureBuilder(
    //   future: ApiManager.getSources(widget.category.id),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       //todo : loading
    //       return MainLoadingWidget();
    //     } else if (snapshot.hasError) {
    //       //todo : error
    //       return MainErrorWidget(
    //         errorMessage: snapshot.error.toString(),
    //         onPressed: () {
    //           ApiManager.getSources(widget.category.id);
    //           setState(() {
    //
    //           });
    //         },
    //       );
    //     }else if(snapshot.data?.status !='ok'){
    //       //todo : server => response
    //       return MainErrorWidget(
    //         errorMessage: snapshot.data!.massage!,
    //         onPressed: () {
    //           ApiManager.getSources(widget.category.id);
    //           setState(() {
    //
    //           });
    //         },
    //       );
    //     }else{
    //       //todo :server => response => success
    //       var sourcesList = snapshot.data?.sources?? [];
    //       return SourceTab(sourcesList: sourcesList);
    //     }
    //   },
    // )
  }
}
