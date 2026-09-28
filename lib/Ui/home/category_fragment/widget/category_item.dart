import 'package:flutter/material.dart';
import 'package:news/api/model/category/category.dart';
import 'package:news/utils/app_colors.dart';

import '../../../../utils/size_utils.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final int index;

  CategoryItem({super.key, required this.category,required this.index});

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    var isEven  =(index % 2==0);
    return SizedBox(
      width: double.infinity,
      child: Stack(
        alignment: isEven?AlignmentDirectional.bottomEnd:
        AlignmentDirectional.bottomStart,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(category.imagePath,
              width: double.infinity,
              height: height * 0.2,
              fit: BoxFit.cover,),
          ),
          Container(
            padding: EdgeInsetsDirectional.only(
              start: isEven?width*0.04 : 0,
              end:!isEven ?width*0.04 : 0
            ),
            margin: EdgeInsets.symmetric(
              horizontal: width*0.04,
              vertical: height*0.02
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: AppColors.greyColor
            ),
            child: Row(
              spacing: width*0.04,
              mainAxisSize: MainAxisSize.min,
              textDirection: isEven ? TextDirection.ltr: TextDirection.rtl,
              children: [
                Text('View All',style:Theme.of(context).textTheme.headlineMedium),
                CircleAvatar(
                  radius: 30,
                  backgroundColor:Theme.of(context).primaryColor ,
                  child: Icon(isEven?
                      Icons.arrow_forward_ios_outlined
                      :
                    Icons.arrow_back_ios_new_outlined,size: 25,color: Theme.of(context).splashColor,),)
              ],
            )
      
          )
        ],
      ),
    );
  }
}
