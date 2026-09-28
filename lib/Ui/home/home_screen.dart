import 'package:flutter/material.dart';
import 'package:news/Ui/home/category_details/sources/source_tab.dart';
import 'package:news/Ui/home/drawer/home_drawer.dart';
import 'package:news/api/model/category/category.dart';
import 'package:news/utils/app_colors.dart';

import 'category_details/category_details.dart';
import 'category_fragment/category_fragment.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedCategory==null?
          'Home':selectedCategory!.title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      drawer: Drawer(
        backgroundColor: AppColors.blackColor,
        child:HomeDrawer(onDrawerClick: onDrawerItemClick,),
      ),
      body:selectedCategory == null ?
      CategoryFragment(onCategoryItemClick:onCategoryItemClick,):
      CategoryDetails(category: selectedCategory!,),

    );
  }

  Category? selectedCategory ;

  void onCategoryItemClick(Category newCategory){
    //todo :newCategory =>user =>Select
    selectedCategory =newCategory;
    setState(() {

    });


  }
  void onDrawerItemClick(){
    selectedCategory =null;
    Navigator.pop(context);
    setState(() {

    });
  }
}
