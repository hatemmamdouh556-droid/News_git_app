import 'package:flutter/material.dart';
import 'package:news/Ui/home/home_screen.dart';
import 'package:news/utils/app_routes.dart';
import 'package:news/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeScreenRoutes,
      routes: {
        AppRoutes.homeScreenRoutes :(context) => HomeScreen(),
      },
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,




    );
  }
}

