import 'package:e_books/core/config/theme/app_colors.dart';
import 'package:e_books/core/config/theme/app_themes.dart';
import 'package:e_books/core/dependency_injection/services_locator.dart';
import 'package:e_books/routing/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await FlutterConfig.loadEnvVariables(); // LOAD ENVIRONMENT

  await ScreenUtil.ensureScreenSize(); // INIT SCREEN UTILS

  DependencyInjection.init(); // DEPENDENCY INJECTION

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
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: GetMaterialApp(
        title: 'E-BOOKS',
        debugShowCheckedModeBanner: false,
        home: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          color: AppColors.greenMain,
          theme: AppTheme.lightTheme,
          routerConfig: router, //
        ),
      ),
    );
  }
}
