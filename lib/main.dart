import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taxiuser/resources/routes/route.dart';
import 'package:taxiuser/screen/HomeScreen/home_screen.dart';
import 'package:taxiuser/screen/SplashScreen/splash_screen.dart';
import 'language/app_translation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          translations: AppTranslations(),
          locale: Locale('en'),
          fallbackLocale: Locale('en'),
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(color: Colors.white),
                backgroundColor: Colors.white),
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: HomeScreen(),
          //initialRoute: RouteName.splash_Screen ,
          getPages: route.appRoute(),
        );
      },
    );
  }
}
