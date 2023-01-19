import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taxi_app_driver/Components/ink_well_custom.dart';
import 'package:flutter_taxi_app_driver/theme/style.dart';
import 'package:flutter_taxi_app_driver/Components/validations.dart';
import 'phone_verification.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isEng = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool autoValidate = false;
  Validations validations = Validations();

  submit() {
    final FormState? form = formKey.currentState;
    if (!form!.validate()) {
      autoValidate = true; // Start validating on every change.
    } else {
      form.save();
      //code
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const PhoneVerification()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//       drawer: Drawer(
//                       backgroundColor: Colors.amber,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
// ElevatedButton(
//   onPressed: (){
//      if(_isEng==true){
//       setState(() {
// context.locale=Locale('ar', 'AE');
// _isEng=!_isEng;

//       });
//     }
//     else if(_isEng==false){
//       setState(() {
//        context.locale=Locale('en', 'US');
// _isEng=!_isEng;

//       });
//     }

// }, child: Text(_isEng==true?"English":"Arabic")),

      //                     MaterialButton(
      //                       shape: StadiumBorder(),
      //                       onPressed: (){
      //                       setState(() {
      // context.locale=Locale('ar', 'AE');
      // });
      //                     },child: Text("Change to Arabic"),),
      //                     SizedBox(height: 20,),
      //                      MaterialButton(
      //                       shape: StadiumBorder(),
      //                       onPressed: (){
      //                       setState(() {
      //   context.locale=Locale('en', 'US');
      // });
      //                      },child: Text("Change to English"),),
      //     ],
      //   ),
      // ),

      body: SingleChildScrollView(
          child: InkWellCustom(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Stack(children: <Widget>[
            Container(
              height: 250.0,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/image/icon/Layer_2.png"),
                    fit: BoxFit.cover),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(18.0, 150.0, 18.0, 0.0),
                child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    child: Column(
                      children: <Widget>[
                        Material(
                          borderRadius: BorderRadius.circular(7.0),
                          elevation: 5.0,
                          child: Container(
                            width: MediaQuery.of(context).size.width - 20.0,
                            height: MediaQuery.of(context).size.height * 0.4,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Form(
                                key: formKey,
                                child: Container(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'login'.tr(),
                                        style: heading35Black,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          TextFormField(
                                              keyboardType: TextInputType.phone,
                                              // validator: validations.validateMobile,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                  ),
                                                  prefixIcon: const Icon(
                                                    Icons.phone,
                                                    color: blackColor,
                                                    size: 20.0,
                                                  ),
                                                  suffixIcon: IconButton(
                                                    icon: const Icon(
                                                      CupertinoIcons
                                                          .clear_thick_circled,
                                                      color: greyColor2,
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                  contentPadding:
                                                      const EdgeInsets.only(
                                                          left: 15.0,
                                                          top: 15.0),
                                                  hintText: 'phone'.tr(),
                                                  hintStyle: const TextStyle(
                                                      color: Colors.grey,
                                                      fontFamily:
                                                          'Quicksand'))),
                                        ],
                                      ),
                                      ButtonTheme(
                                        height: 50.0,
                                        minWidth:
                                            MediaQuery.of(context).size.width,
                                        child: MaterialButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                          elevation: 0.0,
                                          color: primaryColor,
                                          // icon: const Text(''),
                                          child: Text(
                                            'next'.tr(),
                                            style: headingWhite,
                                          ),
                                          onPressed: () {
                                            submit();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ),
                        Container(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "create".tr(),
                                style: textGrey,
                              ),
                              InkWell(
                                onTap: () =>
                                    Navigator.pushNamed(context, '/signup2'),
                                child: Text(
                                  "signup".tr(),
                                  style: textStyleActive,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 80,
                        ),
                        MaterialButton(
                          shape: StadiumBorder(),
                          color: primaryColor,
                          onPressed: () {
                            if (_isEng == true) {
                              setState(() {
                                context.locale = Locale('ar', 'AE');
                                _isEng = !_isEng;
                              });
                            } else if (_isEng == false) {
                              setState(() {
                                context.locale = Locale('en', 'US');
                                _isEng = !_isEng;
                              });
                            }
                          },
                          child: Text(
                            _isEng == true ? "English" : "Arabic",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ))),
          ])
        ]),
      )),
    );
  }
}
