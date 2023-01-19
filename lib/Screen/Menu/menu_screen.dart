
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taxi_app_driver/Screen/History/history_screen.dart';
import 'package:flutter_taxi_app_driver/Screen/Home/home_screen.dart';
import 'package:flutter_taxi_app_driver/Screen/MyWallet/my_wallet.dart';
import 'package:flutter_taxi_app_driver/Screen/Notification/notification.dart';
import 'package:flutter_taxi_app_driver/Screen/Request/request.dart';
import 'package:flutter_taxi_app_driver/Screen/Settings/settings.dart';
import 'package:flutter_taxi_app_driver/Screen/auth_screen/login.dart';
import '../MyProfile/profile.dart';
import '../../theme/style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../MyProfile/my_profile.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../Request/request_detail.dart';

class MenuItems {
  String name;
  IconData icon;
  MenuItems({required this.icon, required this.name});
}

class MenuScreens extends StatelessWidget {
  final String activeScreenName;

  const MenuScreens({Key? key, required this.activeScreenName}) : super(key: key);


  navigatorRemoveUntil(BuildContext context, String router){
    Navigator.of(context).pushNamedAndRemoveUntil('/$router', (Route<dynamic> route) => false);
  }
  
   
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20.0,top: 30.0,right: 20.0,bottom: 0.0),
            color: primaryColor,
            height: 180.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute<Null>(
                          builder: (BuildContext context) {
                            return Profile();
                          },
                        fullscreenDialog: true));
                      },
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(50.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.0),
                          child: Container(
                            height: 50.0,
                            width: 50.0,
                            color: primaryColor,
                            child: CachedNetworkImage(
                              imageUrl: "https://source.unsplash.com/1600x900/?portrait",
                              fit: BoxFit.cover,
                            ),
                          )
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute<Null>(
                          builder: (BuildContext context) {
                            return MyProfile();
                          },
                          fullscreenDialog: true));
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("earlguerrero".tr(),style: textBoldWhite,),
                            Container(
                              padding: EdgeInsets.only(left: 4.0, right: 4.0, top: 2.0, bottom: 2.0),
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Text("gold member".tr(),style: TextStyle(
                                fontSize: 11,
                                color: primaryColor,
                              ),),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.access_time,color: greyColor,),
                            Text("10.2",style: heading18,),
                            Text("hoursonline".tr(),style: TextStyle(
                              fontSize: 11,
                              color: greyColor,
                            ),),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.poll,color: greyColor,),
                            Text("30 KM",style: heading18,),
                            Text("totaldistance".tr(),style: TextStyle(
                              fontSize: 11,
                              color: greyColor,
                            ),),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.content_paste,color: greyColor,),
                            Text("22",style: heading18,),
                            Text("totaljobh".tr(),style: TextStyle(
                              fontSize: 11,
                              color: greyColor,
                            ),),
                          ],
                        ),
                      ),
                    ],
                  )
                ),
              ],
            ),
          ),

//          UserAccountsDrawerHeader(
//            margin: EdgeInsets.all(0.0),
//            accountName: new Text("John",style: headingWhite,),
//            accountEmail: new Text("100 point - Gold member"),
//            currentAccountPicture: new CircleAvatar(
//                backgroundColor: Colors.white,
//                child: new Image(
//                    width: 100.0,
//                    image: new AssetImage('assets/image/taxi-driver.png',)
//                )
//            ),
//            onDetailsPressed: (){
//              Navigator.pop(context);
//              Navigator.of(context).push(new MaterialPageRoute<Null>(
//                  builder: (BuildContext context) {
//                    return MyProfile();
//                  },
//                  fullscreenDialog: true));
//            },
//          ),
          MediaQuery.removePadding(
            context: context,
            // DrawerHeader consumes top MediaQuery padding.
            removeTop: true,
            child: Expanded(
              child: ListView(
                //padding: const EdgeInsets.only(top: 8.0),
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      // The initial contents of the drawer.
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (_){
                                return HomeScreen();
                              }));
                            },
                            child: Container(
                              height: 60.0,
                              color: this.activeScreenName.compareTo("HOME") == 0 ? greyColor : whiteColor,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Icon(FontAwesomeIcons.home,color: blackColor,),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text('home'.tr(),style: headingBlack,),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (_){
                                return RequestScreen();
                              }));
                            },
                            child: Container(
                              height: 60.0,
                              color: this.activeScreenName.compareTo("REQUEST") == 0 ? greyColor : whiteColor,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Icon(FontAwesomeIcons.firstOrder,color: blackColor,),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text('request'.tr(),style: headingBlack,),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder:(_){
                                return MyWallet();
                              }));
                            },
                            child: Container(
                              height: 60.0,
                              color: this.activeScreenName.compareTo("MY WALLET") == 0 ? greyColor : whiteColor,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Icon(FontAwesomeIcons.wallet,color: blackColor,),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text('mywallet'.tr(),style: headingBlack,),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                             Navigator.push(context, MaterialPageRoute(builder: (_){
                              return HistoryScreen();
                             }));
                            },
                            child: Container(
                              height: 60.0,
                              color: this.activeScreenName.compareTo("HISTORY") == 0 ? greyColor : whiteColor,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Icon(FontAwesomeIcons.history,color: blackColor,),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text('history'.tr(),style: headingBlack,),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (_){
                                return NotificationScreens();
                              }));
                            },
                            child: Container(
                              height: 60.0,
                              color: this.activeScreenName.compareTo("NOTIFICATIONS") == 0 ? greyColor : whiteColor,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Icon(FontAwesomeIcons.bell,color: blackColor,),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text('notifications'.tr(),style: headingBlack,),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (_){
                                return SettingsScreen();
                              }));
                            },
                            child: Container(
                              height: 60.0,
                              color: this.activeScreenName.compareTo("SETTINGS") == 0 ? greyColor : whiteColor,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Icon(FontAwesomeIcons.cogs,color: blackColor,),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text('setting'.tr(),style: headingBlack,),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (_){
                                return LoginScreen();
                              }));
                            },
                            child: Container(
                              height: 60.0,
                              color: whiteColor,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Icon(FontAwesomeIcons.signOutAlt,color: blackColor,),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text('logout'.tr(),style: headingBlack,),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          
                        ],
                      ),
                      // The drawer's "details" view.
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
