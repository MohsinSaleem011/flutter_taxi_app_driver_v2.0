import 'package:flutter/material.dart';
import 'package:flutter_taxi_app_driver/Screen/History/history_screen.dart';
import 'package:flutter_taxi_app_driver/Screen/Home/home_screen.dart';
import 'package:flutter_taxi_app_driver/Screen/MyProfile/my_profile.dart';
import 'package:flutter_taxi_app_driver/Screen/MyProfile/profile.dart';
import 'package:flutter_taxi_app_driver/Screen/MyWallet/my_wallet.dart';
import 'package:flutter_taxi_app_driver/Screen/MyWallet/payment.dart';
import 'package:flutter_taxi_app_driver/Screen/Notification/notification.dart';
import 'package:flutter_taxi_app_driver/Screen/Request/request.dart';
import 'package:flutter_taxi_app_driver/Screen/Settings/settings.dart';
import 'package:flutter_taxi_app_driver/Screen/auth_screen/login.dart';
import 'package:flutter_taxi_app_driver/Screen/auth_screen/signup_screen.dart';
import 'package:flutter_taxi_app_driver/Screen/UseMyLocation/use_my_location.dart';

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({ required WidgetBuilder builder, required RouteSettings settings })
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (animation.status == AnimationStatus.reverse) {
      return super.buildTransitions(context, animation, secondaryAnimation, child);
    }
    return FadeTransition(opacity: animation, child: child);
  }
}

MaterialPageRoute getRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/home': return MyCustomRoute(
      builder: (_) => const HomeScreen(),
      settings: settings,
    );
    case '/signup2': return MyCustomRoute(
      builder: (_) => const SignUpScreen(),
      settings: settings,
    );
    case '/login': return MyCustomRoute(
      builder: (_) => const LoginScreen(),
      settings: settings,
    );
    // case '/walkthrough': return new MyCustomRoute(
    //   builder: (_) => new WalkthroughScreen(),
    //   settings: settings,
    // );
    case '/use_my_location': return MyCustomRoute(
      builder: (_) => const UseMyLocation(),
      settings: settings,
    );
    case '/payment_method': return MyCustomRoute(
      builder: (_) => PaymentMethod(),
      settings: settings,
    );
    case '/request': return MyCustomRoute(
      builder: (_) => RequestScreen(),
      settings: settings,
    );
    case '/my_wallet': return MyCustomRoute(
      builder: (_) => MyWallet(),
      settings: settings,
    );
    case '/history': return MyCustomRoute(
      builder: (_) => const HistoryScreen(),
      settings: settings,
    );
    case '/notification': return MyCustomRoute(
      builder: (_) => NotificationScreens(),
      settings: settings,
    );
    case '/setting': return MyCustomRoute(
      builder: (_) => SettingsScreen(),
      settings: settings,
    );
    case '/profile': return MyCustomRoute(
      builder: (_) => Profile(),
      settings: settings,
    );
    case '/edit_profile': return MyCustomRoute(
      builder: (_) => MyProfile(),
      settings: settings,
    );
    case '/logout': return MyCustomRoute(
      builder: (_) => const LoginScreen(),
      settings: settings,
    );
    default:
      return MyCustomRoute(
        builder: (_) => const HomeScreen(),
        settings: settings,
      );
  }
}
