import 'package:flutter/material.dart';
import 'package:news/Ui/home/drawer/widget/config_item.dart';
import 'package:news/Ui/home/drawer/widget/divider_item.dart';
import 'package:news/Ui/home/drawer/widget/drawer_item.dart';
import 'package:news/utils/app_assets.dart';
import 'package:news/utils/app_colors.dart';
import 'package:news/utils/app_styles.dart';
import 'package:news/utils/size_utils.dart';

class HomeDrawer extends StatelessWidget {
  final VoidCallback onDrawerClick ;
  const HomeDrawer({super.key,required this.onDrawerClick});

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    return Column(
      spacing: height*0.02,
      children: [
        Container(
          alignment: Alignment.center,
          height: height * 0.20,
          color: AppColors.whiteColor,
          child: Text("News app", style: AppStyles.bold24Black),
        ),
        InkWell(onTap: (){
          //todo : go to home
          onDrawerClick();
        },
            child: DrawerItem(iconName: AppAssets.homeIcon, text: 'Go To Home')),
        DividerItem(),
        DrawerItem(iconName: AppAssets.themeIcon, text: 'theme'),
        ConfigItem(text: 'Dark', onPressed: (){
          //todo :show theme bottom sheet

        }),
        DividerItem(),
        DrawerItem(iconName: AppAssets.languageIcon, text: 'Language'),
        ConfigItem(text: 'English', onPressed: (){
          //todo :show language bottom sheet

        }),
      ],
    );
  }

}
