import 'package:news/utils/app_assets.dart';

class Category {
  String id;
  String title;
  String imagePath;
  Category({required this.id ,required this.title ,required this.imagePath});
  static List<Category> getCategoryList(bool isDark){

    return [
      Category(id: 'general',
          title: 'General',
           imagePath: isDark ? AppAssets.generalLight:
      AppAssets.generalDark),
      Category(id: 'business',
          title: 'Business',
           imagePath: isDark ? AppAssets.businessLight:
      AppAssets.businessDark),
      Category(id: 'sports',
          title: 'Sports',
           imagePath: isDark ? AppAssets.sportsLight:
      AppAssets.sportsDark),
      Category(id: 'technology',
          title: 'Technology',
           imagePath: isDark ? AppAssets.technologyLight:
      AppAssets.technologyDark),
      Category(id: 'science',
          title: 'Science',
           imagePath: isDark ? AppAssets.scienceLight:
      AppAssets.scienceDark),
      Category(id: 'health',
          title: 'Health',
           imagePath: isDark ? AppAssets.healthLight:
      AppAssets.healthDark),
      Category(id: 'entertainment',
          title: 'Entertainment',
           imagePath: isDark ? AppAssets.entertainmentLight:
      AppAssets.entertainmentDark)
    ];

  }


}