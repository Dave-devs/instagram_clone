import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/core/palette.dart';
import 'package:instagram_clone/features/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 725),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (BuildContext context, child) =>
      MaterialApp(
          title: 'Davedevs Instagram Clone App',
          theme: ThemeData.dark(useMaterial3: true).copyWith(
            scaffoldBackgroundColor: Palette.bgColor,
            appBarTheme: AppBarTheme(backgroundColor: Palette.bgColor)
          ),
          home: const SignUpPage(),
        )
    );
  }
}