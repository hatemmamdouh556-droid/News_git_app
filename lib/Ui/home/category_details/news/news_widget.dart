import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news/Ui/home/category_details/news/cubit/news_states.dart';
import 'package:news/Ui/home/category_details/news/cubit/news_view_model.dart';
import 'package:news/Ui/home/category_details/news/news_item.dart';
import 'package:news/Ui/widget/main_error_widget.dart';
import 'package:news/Ui/widget/main_loading_widget.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/api/model/sources/source.dart';
import 'package:news/di/di.dart';
import 'package:news/di/di_inject.dart';
import 'package:news/utils/size_utils.dart';
@injectable
class NewsWidget extends StatefulWidget {
  final Source source;

  NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsViewModel viewModel = getIt();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    viewModel.getNewsBySoursId(widget.source.id??'');
  }
  @override
  void didUpdateWidget(covariant NewsWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if(oldWidget.source.id != widget.source.id){
      viewModel.getNewsBySoursId(widget.source.id ?? '');
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    viewModel.close();
    super.dispose();


  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: viewModel,
        listenWhen: (previous, current) {
        if(current is NewsLoadingStates){
          return true;
        }return false;
        },
        buildWhen: (previous, current) {
          if(current is NewsInitialStates){
            return false;
          }return true;
        },
        listener: (context, state) {
        if(state is NewsLoadingStates){
          //todo : alert dialog
         }else if(state is NewsErrorStates){

        }else if (state is NewsSuccessStates){

        }

        },
      builder: (context, state) {
        if(state is NewsLoadingStates){
          return MainLoadingWidget();
        }else if (state is NewsErrorStates){
          return MainErrorWidget(
              errorMessage: state.errorMessage,
              onPressed: (){
                viewModel.getNewsBySoursId(widget.source.id??'');
              });
        }else if (state is NewsSuccessStates){
          var newsList =state.newsList;
          return newsList.isEmpty?
          Center(child: Text('No News Item Found',style: Theme.of(context).textTheme.headlineMedium,)):
          ListView.separated(
            itemBuilder: (context, index) {
              return NewsItem(news: newsList[index]);
            },
            separatorBuilder: (context, index) {
              return SizedBox(height:context.height*0.02 ,);
            },
            itemCount: newsList.length,
          );
        }
        return Container();
      },

    );
    BlocBuilder<NewsViewModel,NewsStates>(
      bloc: viewModel,
      builder: (context, state) {
        if(state is NewsLoadingStates){
          return MainLoadingWidget();
        }else if (state is NewsErrorStates){
          return MainErrorWidget(
              errorMessage: state.errorMessage,
              onPressed: (){
                viewModel.getNewsBySoursId(widget.source.id??'');
              });
        }else if (state is NewsSuccessStates){
          var newsList =state.newsList;
          return newsList.isEmpty?
          Center(child: Text('No News Item Found',style: Theme.of(context).textTheme.headlineMedium,)):
          ListView.separated(
            itemBuilder: (context, index) {
              return NewsItem(news: newsList[index]);
            },
            separatorBuilder: (context, index) {
              return SizedBox(height:context.height*0.02 ,);
            },
            itemCount: newsList.length,
          );
        }
        return Container();
      }, );
    // FutureBuilder(
    //   future: ApiManager.getNewsBySourceId(widget.source.id ?? ''),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       //todo : loading
    //       return MainLoadingWidget();
    //     } else if (snapshot.hasError) {
    //       //todo : Error
    //       return MainErrorWidget(
    //           errorMessage: snapshot.error.toString(),
    //           onPressed: () {
    //             ApiManager.getNewsBySourceId(widget.source.id ?? '');
    //             setState(() {
    //
    //             });
    //
    //           }
    //       );
    //
    //     }else if(snapshot.data?.status != 'ok'){
    //       //todo : Error = server => response
    //       return MainErrorWidget(
    //           errorMessage: snapshot.data!.message!,
    //           onPressed: () {
    //             ApiManager.getNewsBySourceId(widget.source.id ?? '');
    //             setState(() {
    //
    //             });
    //           }
    //       );
    //     }else{
    //       //todo : server => response =>success
    //       var newsList =snapshot.data?.articles ??[];
    //       return newsList.isEmpty?
    //       Center(child: Text('No News Item Found',style: Theme.of(context).textTheme.headlineMedium,)):
    //       ListView.separated(
    //         itemBuilder: (context, index) {
    //           return NewsItem(news: newsList[index]);
    //         },
    //         separatorBuilder: (context, index) {
    //           return SizedBox(height:context.height*0.02 ,);
    //         },
    //         itemCount: newsList.length,
    //       );
    //     }
    //   },
    // )
  }
}
