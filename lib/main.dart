import 'package:flutter/material.dart';
import 'package:flutter_taxi_app_driver/Screen/Home/home_screen.dart';
import 'package:flutter_taxi_app_driver/Screen/SplashScreen/splash_screen.dart';
import 'theme/style.dart';
import 'router.dart';
import 'package:easy_localization/easy_localization.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(

    fallbackLocale: Locale('en','US'),
    supportedLocales: [
    Locale('en','US'),
    Locale('ar','AE'),], 
    path: 'assets/translations',
    child: MyApp(),
    ),);
    }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

 @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Taxi App Driver',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      onGenerateRoute: (RouteSettings settings) => getRoute(settings),
      home: const SplashScreen(),
    );
  }
}
