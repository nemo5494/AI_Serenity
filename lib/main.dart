import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aiserenity/data/app_colors.dart';
import 'package:aiserenity/views/onboarding/onboarding_view.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: MaterialApp(
              title: 'AI Serenity',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  primaryColor: AppColors.kprimary,
                  scaffoldBackgroundColor: AppColors.kWhite,
                  appBarTheme: AppBarTheme(backgroundColor: AppColors.kWhite)),
              scrollBehavior:
                  const ScrollBehavior().copyWith(overscroll: false),
              home: const Onbaording()),
        );
      },
    );
  }
}
