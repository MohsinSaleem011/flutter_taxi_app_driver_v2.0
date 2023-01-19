import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final TextInputType textInputType;
  final Color textFieldColor, iconColor;
  final bool obscureText;
  final bool? enable;
  final double bottomMargin;
  final TextStyle? textStyle, hintStyle;
  final FormFieldSetter<String>? onSaved;

  InputField({
    required this.hintText,
    required this.obscureText,
    required this.textInputType,
    required this.textFieldColor,
    required this.icon,
    required  this.iconColor,
    required  this.bottomMargin,
    required this.textStyle,
      this.onSaved,
      this.enable,
      this.hintStyle});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (new Container(
        margin: new EdgeInsets.only(bottom: bottomMargin),
        child: new DecoratedBox(
          decoration: new BoxDecoration(
              borderRadius: new BorderRadius.all(new Radius.circular(30.0)),
              color: textFieldColor),
          child: new TextFormField(
            style: textStyle,
            key: key,
            obscureText: obscureText,
            keyboardType: textInputType,
            onSaved: onSaved,
           //focusNode: new FocusNode(),
            enabled: enable,
            decoration: new InputDecoration(
              border: InputBorder.none,

              hintText: hintText,
              hintStyle: hintStyle,
              icon: new Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
                child: new Icon(
                  icon,
                  color: iconColor,
                ),
              ),
              // hideDivider: true
            ),
          ),
        )));
  }
}
