import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_taxi_app_driver/theme/style.dart';

class LoadingBuilder extends StatelessWidget {
  const LoadingBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bodyProgress = const SpinKitRipple(color: primaryColor,size: 100.0,);
    return bodyProgress;
  }
}
//SpinKitRipple(color: primaryColor),
