import 'package:flutter/material.dart';
import 'package:news/Ui/home/category_details/news/news_item.dart';
import 'package:news/Ui/widget/main_error_widget.dart';
import 'package:news/Ui/widget/main_loading_widget.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/api/dio/dio_manager.dart';
import 'package:news/api/model/sources/source.dart';
import 'package:news/utils/size_utils.dart';
import 'package:news/api/model/sources/source_response.dart';

class NewsWidget extends StatefulWidget {
  final Source source;

  NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DioManager().getNewsBySourceId(widget.source.id ?? ''),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          //todo : loading
          return MainLoadingWidget();
        } else if (snapshot.hasError) {
          //todo : Error
          return MainErrorWidget(
              errorMessage: snapshot.error.toString(),
              onPressed: () {
                DioManager().getNewsBySourceId(widget.source.id ?? '');
                setState(() {

                });

              }
          );

        }else if(snapshot.data?.status != 'ok'){
          //todo : Error = server => response
          return MainErrorWidget(
              errorMessage: snapshot.data!.message!,
              onPressed: () {
                ApiManager.getNewsBySourceId(widget.source.id ?? '');
                setState(() {

                });
              }
          );
        }else{
          //todo : server => response =>success
          var newsList =snapshot.data?.articles??[];
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
        },
    );
  }
}
