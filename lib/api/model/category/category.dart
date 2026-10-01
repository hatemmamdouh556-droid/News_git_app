import 'package:flutter/material.dart';
import 'package:news/utils/app_assets.dart';

import '../../../l10n/app_localizations.dart';

class Category {
  String id;
  String title;
  String imagePath;

  Category({required this.id, required this.title, required this.imagePath});

  static List<Category> getCategoryList(BuildContext context, bool isDark) {
    final t = AppLocalizations.of(context)!;

    return [
      Category(
        id: 'general',
        title: t.general,
        imagePath: isDark ? AppAssets.generalLight : AppAssets.generalDark,
      ),
      Category(
        id: 'business',
        title: t.business,
        imagePath: isDark ? AppAssets.businessLight : AppAssets.businessDark,
      ),
      Category(
        id: 'sports',
        title: t.sports,
        imagePath: isDark ? AppAssets.sportsLight : AppAssets.sportsDark,
      ),
      Category(
        id: 'technology',
        title: t.technology,
        imagePath: isDark ? AppAssets.technologyLight : AppAssets.technologyDark,
      ),
      Category(
        id: 'science',
        title: t.science,
        imagePath: isDark ? AppAssets.scienceLight : AppAssets.scienceDark,
      ),
      Category(
        id: 'health',
        title: t.health,
        imagePath: isDark ? AppAssets.healthLight : AppAssets.healthDark,
      ),
      Category(
        id: 'entertainment',
        title: t.entertainment,
        imagePath: isDark
            ? AppAssets.entertainmentLight
            : AppAssets.entertainmentDark,
      ),
    ];
  }
}