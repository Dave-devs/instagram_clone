import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/core/palette.dart';
import 'package:instagram_clone/features/login_page.dart';
import 'package:instagram_clone/providers/user_provider.dart';
import 'package:instagram_clone/responsive_layout/layout_builder.dart';
import 'package:instagram_clone/responsive_layout/mobile_screen.dart';
import 'package:instagram_clone/responsive_layout/web_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider())
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 725),
        minTextAdapt: true,
        useInheritedMediaQuery: true,
        builder: (BuildContext context, child) =>
        MaterialApp(
            title: 'Davedevs Instagram Clone App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData.dark(useMaterial3: true).copyWith(
              scaffoldBackgroundColor: Palette.bgColor,
              appBarTheme: AppBarTheme(backgroundColor: Palette.bgColor)
            ),
            home: StreamBuilder(
              stream: _auth.authStateChanges(),
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.active) {
                  if(snapshot.hasData) {
                    return const LayoutScreenBuilder(
                      mobileScreen: MobileScreen(),
                      webScreen: WebScreen()
                    );
    
                  } else if(snapshot.hasError) {
                    return Center(
                      child: Text('Internal error occured: ${snapshot.error}'),
                    );
                  }
                } else if(snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Palette.primaryColor,
                    ),
                  );
                }
  
                return const LoginPage();
              }
            ),
          )
      ),
    );
  }
}