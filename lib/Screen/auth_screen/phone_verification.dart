import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taxi_app_driver/Components/ink_well_custom.dart';
import 'package:flutter_taxi_app_driver/Screen/Walkthrough/walkthrough.dart';
import 'package:flutter_taxi_app_driver/Screen/auth_screen/login.dart';
import 'package:flutter_taxi_app_driver/theme/style.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class PhoneVerification extends StatefulWidget {
  const PhoneVerification({Key? key}) : super(key: key);

  @override
  _PhoneVerificationState createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  TextEditingController controller = TextEditingController();
  String thisText = "";
  int pinLength = 4;

  bool hasError = false;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: whiteColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: blackColor,
          ),
          onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => LoginScreen())),
        ),
      ),
      body: SingleChildScrollView(
          child: InkWellCustom(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Container(
          color: whiteColor,
          padding: EdgeInsets.fromLTRB(
              screenSize.width * 0.13, 0.0, screenSize.width * 0.13, 0.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 10.0),
                  child: Text(
                    'phoneverification'.tr(),
                    style: headingBlack,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: const Text('enteryourotp').tr(),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 30.0, bottom: 60.0),
                  child: PinCodeTextField(
                    autofocus: true,
                    controller: controller,
                    hideCharacter: false,
                    highlight: true,
                    highlightColor: secondary,
                    defaultBorderColor: blackColor,
                    hasTextBorderColor: primaryColor,
                    maxLength: pinLength,
                    hasError: hasError,
                    maskCharacter: "*",
                    onTextChanged: (text) {
                      setState(() {
                        hasError = false;
                      });
                    },
                    onDone: (text) {
                      print("DONE $text");
                    },
                    wrapAlignment: WrapAlignment.start,
                    pinBoxDecoration:
                        ProvidedPinBoxDecoration.underlinedPinBoxDecoration,
                    pinTextStyle: heading35Black,
                    pinTextAnimatedSwitcherTransition:
                        ProvidedPinBoxTextAnimation.scalingTransition,
                    pinTextAnimatedSwitcherDuration:
                        Duration(milliseconds: 300),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonTheme(
                      height: 45.0,
                      minWidth: MediaQuery.of(context).size.width - 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: primaryColor,
                        ),
                        child: Text(
                          'verifynow'.tr(),
                          style: headingWhite,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const WalkthroughScreen())
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          onTap: () => Navigator.pushNamed(context, '/signup2'),
                          child: Text(
                            "didnotgetacode".tr(),
                            style: textStyleActive,
                          ),
                        ),
                      ],
                    )),
              ]),
        ),
      )),
    );
  }
}
