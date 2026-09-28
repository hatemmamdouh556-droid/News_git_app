import 'package:flutter/material.dart';
import 'package:news/Ui/home/category_details/category_details.dart';
import 'package:news/Ui/home/category_details/sources/source_tab.dart';
import 'package:news/Ui/widget/main_error_widget.dart';
import 'package:news/Ui/widget/main_loading_widget.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/api/model/category/category.dart';


class CategoryDetails extends StatefulWidget {
  final Category category;
   CategoryDetails({super.key,required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(widget.category.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          //todo : loading
          return MainLoadingWidget();
        } else if (snapshot.hasError) {
          //todo : error
          return MainErrorWidget(
            errorMessage: snapshot.error.toString(),
            onPressed: () {
              ApiManager.getSources(widget.category.id);
              setState(() {

              });
            },
          );
        }else if(snapshot.data?.status !='ok'){
          //todo : server => response
          return MainErrorWidget(
            errorMessage: snapshot.data!.massage!,
            onPressed: () {
              ApiManager.getSources(widget.category.id);
              setState(() {

              });
            },
          );
        }else{
          //todo :server => response => success
          var sourcesList = snapshot.data?.sources?? [];
          return SourceTab(sourcesList: sourcesList);
        }
      },
    );
  }
}
