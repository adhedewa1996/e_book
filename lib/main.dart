import 'package:e_books/core/config/theme/app_colors.dart';
import 'package:e_books/core/config/theme/app_themes.dart';
import 'package:e_books/core/dependency_injection/services_locator.dart';
import 'package:e_books/data/sources/hive.dart';
import 'package:e_books/routing/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'presentation/audio_book_mode/audio_book_mode.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await FlutterConfig.loadEnvVariables(); // LOAD ENVIRONMENT

  await ScreenUtil.ensureScreenSize(); // INIT SCREEN UTILS

  DependencyInjection.init(); // DEPENDENCY INJECTION

  await sl<HiveServices>().init(); // INIT LOCAL STORAGE

  runApp(ScreenUtils()); // RUN APP
}

class ScreenUtils extends StatelessWidget {
  const ScreenUtils({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MyApp(), //
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: GetMaterialApp(
        title: 'E-BOOKS',
        debugShowCheckedModeBanner: false,
        home: Stack(
          children: [
            MaterialApp.router(
              debugShowCheckedModeBanner: false,
              color: AppColors.greenMain,
              theme: AppTheme.lightTheme,
              routerConfig: router, //
            ),
            if (mounted) AudioBookMode(),
          ],
        ),
      ),
    );
  }
}
