import 'package:flutter/material.dart';
import 'package:news/Ui/home/drawer/widget/config_item.dart';
import 'package:news/Ui/home/drawer/widget/divider_item.dart';
import 'package:news/Ui/home/drawer/widget/drawer_item.dart';
import 'package:news/Ui/home/drawer/widget/language_bottom_sheet.dart';
import 'package:news/Ui/home/drawer/widget/theme_bottom_sheet.dart';
import 'package:news/l10n/app_localizations.dart';
import 'package:news/providers/app_language_provider.dart';
import 'package:news/utils/app_assets.dart';
import 'package:news/utils/app_colors.dart';
import 'package:news/utils/app_styles.dart';
import 'package:news/utils/size_utils.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_theme_provider.dart';

class HomeDrawer extends StatefulWidget {
  final VoidCallback onDrawerClick ;
  const HomeDrawer({super.key,required this.onDrawerClick});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var height = context.height;
    var width = context.width;
    return Column(
      spacing: height*0.02,
      children: [
        Container(
          alignment: Alignment.center,
          height: height * 0.20,
          color: AppColors.whiteColor,
          child: Text(AppLocalizations.of(context)!.news_app, style: AppStyles.bold24Black),
        ),
        InkWell(onTap: (){
          //todo : go to home
          widget.onDrawerClick();
        },
            child: DrawerItem(iconName: AppAssets.homeIcon, text: AppLocalizations.of(context)!.go_to_home)),
        DividerItem(),
        DrawerItem(iconName: AppAssets.themeIcon, text:  AppLocalizations.of(context)!.theme),
        ConfigItem(text: themeProvider.isDark?
        AppLocalizations.of(context)!.dark:
        AppLocalizations.of(context)!.light, onPressed: (){
          //todo :show theme bottom sheet
          showThemeBottomSheet();

        }),
        DividerItem(),
        DrawerItem(iconName: AppAssets.languageIcon, text: AppLocalizations.of(context)!.language),
        ConfigItem(text:languageProvider.appLanguage=='en'?
        AppLocalizations.of(context)!.english:
        AppLocalizations.of(context)!.arabic, onPressed: (){
          //todo :show language bottom sheet
          showLanguageBottomSheet();
        }),
      ],
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => ThemeBottomSheet(),);
  }
  void showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => LanguageBottomSheet(),
    ) ;
  }
}
