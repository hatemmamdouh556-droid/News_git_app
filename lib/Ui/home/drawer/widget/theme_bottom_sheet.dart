import 'package:flutter/material.dart';
import 'package:news/providers/app_theme_provider.dart';
import 'package:provider/provider.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';
import '../../../../utils/size_utils.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.04,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () => themeProvider.changeTheme(ThemeMode.dark),
            child: _buildThemeItem(
              title: AppLocalizations.of(context)!.dark,
              isSelected: themeProvider.isDark,
            ),
          ),
          SizedBox(height: height * 0.02),
          InkWell(
            onTap: () => themeProvider.changeTheme(ThemeMode.light),
            child: _buildThemeItem(
              title: AppLocalizations.of(context)!.light,
              isSelected: !themeProvider.isDark,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThemeItem({required String title, required bool isSelected}) {
    final color = Theme.of(context).colorScheme.onSurface;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyles.bold16Black.copyWith(color: color),
        ),
        if (isSelected)
          Icon(Icons.check, color: Theme.of(context).primaryColor, size: 25),
      ],
    );

  }
}
