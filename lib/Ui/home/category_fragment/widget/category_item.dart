import 'package:flutter/material.dart';
import 'package:news/api/model/category/category.dart';
import 'package:news/utils/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../../providers/app_language_provider.dart';
import '../../../../utils/size_utils.dart';


class CategoryItem extends StatelessWidget {
  final Category category;
  final int index;
  Category? selectedCategory ;

  CategoryItem({super.key, required this.category,required this.index});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);

    var height = context.height;
    var width = context.width;
    var isEven  =(index % 2==0);
    return SizedBox(
      width: double.infinity,
      child: Stack(
        alignment:languageProvider.appLanguage == 'en'? isEven?AlignmentDirectional.bottomEnd:
        AlignmentDirectional.bottomStart :
        isEven?AlignmentDirectional.bottomStart:
        AlignmentDirectional.bottomEnd
        ,
        children: [

          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(category.imagePath,
              width: double.infinity,
              height: height * 0.2,
              fit: BoxFit.cover,),
          ),
          Positioned(
            bottom: height * 0.02 + 60 + 40,
            right: isEven ? width * 0.1 : null,
            left: isEven ? null : width * 0.1,
            child: Text(
              category.title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 36),
            ),
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
              textDirection:languageProvider.appLanguage=='en'?
              isEven ? TextDirection.ltr: TextDirection.rtl:
              isEven ? TextDirection.rtl: TextDirection.ltr
              ,
              children: [
                Text('View All',style:Theme.of(context).textTheme.headlineMedium),
                CircleAvatar(
                  radius: 30,
                  backgroundColor:Theme.of(context).primaryColor ,
                  child:languageProvider.appLanguage=='en'? Icon(isEven?
                      Icons.arrow_forward_ios_outlined
                      :
                    Icons.arrow_back_ios_new_outlined,size: 25,color: Theme.of(context).splashColor,):
                  Icon(isEven?
                  Icons.arrow_back_ios_new_outlined
                      :
                  Icons.arrow_forward_ios_outlined,size: 25,color: Theme.of(context).splashColor,)
                  ,
                )
              ],
            )

          )
        ],
      ),
    );
  }

}
