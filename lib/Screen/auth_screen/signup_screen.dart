import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taxi_app_driver/Components/ink_well_custom.dart';
import 'package:flutter_taxi_app_driver/Screen/auth_screen/login.dart';
import 'package:flutter_taxi_app_driver/theme/style.dart';
import 'package:flutter_taxi_app_driver/Screen/Home/home_screen.dart';
import 'package:flutter_taxi_app_driver/Components/validations.dart';

import 'forgetpassword.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool autoValidate = false;
  Validations validations = Validations();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: InkWellCustom(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Stack(children: <Widget>[
                    Container(
                      height: 250.0,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/image/icon/Layer_2.png"),
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(18.0, 100.0, 18.0, 0.0),
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
                                    height: MediaQuery.of(context).size.height *0.65,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20.0)),
                                    child: Form(
                                        child: Container(
                                          padding: const EdgeInsets.all(18.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              SizedBox(
                                                height: 100.0,
                                                width: 300.0,
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: <Widget>[
                                                    Text('up'.tr(), style: heading35Black,),
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  TextFormField(
                                                      keyboardType: TextInputType.emailAddress,
                                                      // validator: validation.validateEmail,
                                                      decoration: InputDecoration(
                                                        border: OutlineInputBorder(
                                                          borderRadius: BorderRadius.circular(5.0),
                                                        ),
                                                        prefixIcon: const Icon(Icons.email,
                                                            color: blackColor, size: 20.0),
                                                        contentPadding: const EdgeInsets.only(left: 15.0, top: 15.0),
                                                        hintText: 'email'.tr(),
                                                        hintStyle: const TextStyle(color: Colors.grey, fontFamily: 'Quicksand'),

                                                      )
                                                  ),
                                                  const Padding(
                                                    padding: EdgeInsets.only(top: 20.0),
                                                  ),
                                                  TextFormField(
                                                      keyboardType: TextInputType.phone,
                                                      // validator: validations.validateMobile,
                                                      decoration: InputDecoration(
                                                          border: OutlineInputBorder(
                                                            borderRadius: BorderRadius.circular(5.0),
                                                          ),
                                                          prefixIcon: const Icon(Icons.phone,
                                                              color: blackColor, size: 20.0),
                                                          contentPadding: const EdgeInsets.only(left: 15.0, top: 15.0),
                                                          hintText: 'phone'.tr(),
                                                          hintStyle: const TextStyle(color: Colors.grey, fontFamily: 'Quicksand')
                                                      )
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                padding: const EdgeInsets.only(top: 20.0,bottom: 20.0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      InkWell(
                                                        onTap: (){
                                                          Navigator.push(context, MaterialPageRoute(builder: (_){
return ForgetPassword();}));
                                                        },
                                                        child: Text("forgetpassword".tr(),style: textStyleActive,),
                                                      ),
                                                    ],
                                                  )

                                              ),
                                              SizedBox(
                                                height: 50.0,
                                                width: MediaQuery.of(context).size.width,
                                                child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                    primary: primaryColor,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(25),
                                                    ),
                                                    elevation: 15.0,
                                                  ),
                                                  child: Text('sign'.tr(), style: headingWhite,),
                                                  onPressed: (){
                                                    Navigator.of(context).push(
                                                      MaterialPageRoute(builder: (context) => const HomeScreen()));
                                                    },
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                    ),
                                  ),
                                ),
                                Container(
                                    padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text("allreadyhaveaccount".tr(),style: textGrey,),
                                        
                                          InkWell(
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (_){
                                                return LoginScreen();
                                              }));
                                            },
                                            child: Text("login".tr(),style: textStyleActive,)),
                              
                                      ],
                                    )
                                ),
                              ],
                            )
                        )
                    ),
                  ]
                  )
                ]
            ),
          )

      ),
    );
  }
}
