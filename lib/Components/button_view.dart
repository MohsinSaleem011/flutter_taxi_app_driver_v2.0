import 'package:flutter/material.dart';
import 'package:flutter_taxi_app_driver/theme/style.dart';

class ButtonView extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Icon? icon;
  final bool? disable;
  final Color? color;
  final TextStyle? textStyle;
  final double? elevation;
  final double? height;
  final double? radius;
  final bool? outline;

  const ButtonView({Key? key,
    required this.title,
    required this.onPressed,
    this.icon,
    this.disable,
    this.color,
    this.textStyle,
    this.elevation,
    this.height,
    this.radius,
    this.outline
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 8),
          ),
          elevation: 15.0,
        ),
        child: Text(title, style: headingWhite,),
        onPressed: onPressed,
      ),
    );
  }
}
