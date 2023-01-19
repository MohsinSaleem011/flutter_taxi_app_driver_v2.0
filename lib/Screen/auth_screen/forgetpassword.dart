import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_taxi_app_driver/Screen/auth_screen/signup_screen.dart';


class ForgetPassword extends StatefulWidget {
  
  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Image.asset("assets/image/icon/taxi1.jpg",
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
            ),
            SizedBox(
              height: 30,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                child: ListView(
                  children:[ Column(
                    children: [
                      SizedBox(
                        height: 280,
                      ),
                      Container(
                        height: 60,
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(205),
                          border:
                              Border.all(color: Colors.black.withOpacity(0.5)),
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: "newpassword".tr(),
                            border: InputBorder.none,
                          ),
                          textInputAction: TextInputAction.next,
                          focusNode: FocusNode(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 60,
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(205),
                          border:
                              Border.all(color: Colors.black.withOpacity(0.5)),
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: "confirmpassword".tr(),
                            border: InputBorder.none,
                          ),
                          textInputAction: TextInputAction.next,
                          focusNode: FocusNode(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                       Container(
                        height: 60,
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(205),
                          border:
                              Border.all(color: Colors.black.withOpacity(0.5)),
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: "enteryourmail".tr(),
                            border: InputBorder.none,
                          ),
                          textInputAction: TextInputAction.next,
                          focusNode: FocusNode(),
                        ),
                      ),
                      SizedBox(height: 20,),
                      MaterialButton(
                        
                        color: Colors.amber,
                        shape: StadiumBorder(),
                        child: Text("confirmchange").tr(),
                        onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_){
                          return SignUpScreen();
                        }));
                      })
                     
                    ],
                  ),
           ] ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
