import 'package:flutter/material.dart';
import 'package:news/Ui/home/category_fragment/widget/category_item.dart';
import 'package:news/api/model/category/category.dart';

import '../../../utils/size_utils.dart';

typedef OnCategoryItemClick = void Function(Category);
class CategoryFragment extends StatelessWidget {
  final OnCategoryItemClick onCategoryItemClick ;
   CategoryFragment({super.key,required this.onCategoryItemClick});
   List<Category> categoryList = [];

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    categoryList = Category.getCategoryList(true);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: height*0.02,
        children: [
          Text(
            'Good Morning\nHere is Some News For You',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder:(context, index) {
                return InkWell(
                  onTap: (){
                    //todo :add call back
                    onCategoryItemClick(categoryList[index]);
                  },
                    child: CategoryItem(category: categoryList[index ],index: index,));
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: height*0.02,);
              },
              itemCount: categoryList.length,
            ),
          ),
        ],
      ),
    );
  }
}
