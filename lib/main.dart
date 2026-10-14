import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

import 'package:news/Ui/home/home_screen.dart';
import 'package:news/hive/hive_registrar.g.dart';
import 'package:news/utils/app_routes.dart';
import 'package:news/utils/app_theme.dart';
import 'package:news/utils/my_bloc_observer.dart';
import 'package:path_provider/path_provider.dart';

import 'di/di_inject.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  //todo : initialize hive
  // final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
  // Hive.init(appDocumentsDir.path);
  await Hive.initFlutter();
  Hive.registerAdapters();
  configureDependencies();
  runApp( MyApp());
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

