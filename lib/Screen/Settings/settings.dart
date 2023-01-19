import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taxi_app_driver/Components/ink_well_custom.dart';
import 'package:flutter_taxi_app_driver/Screen/MyProfile/profile.dart';
import 'package:flutter_taxi_app_driver/theme/style.dart';
import 'package:flutter_taxi_app_driver/Screen/Menu/menu_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_taxi_app_driver/Components/list_menu.dart';
import 'invite_friends.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final String screenName = "SETTINGS";

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: whiteColor,
        title: const Text(
          'Settings',
          style: TextStyle(color: blackColor),
        ),
        iconTheme: const IconThemeData(color: blackColor),
      ),
      // drawer: MenuScreens(activeScreenName: screenName),
      body: SingleChildScrollView(
        child: InkWellCustom(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Container(
              color: backgroundColor,
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute<Null>(
                        builder: (BuildContext context) {
                          return Profile();
                        },
                      ));
                    },
                    child: Container(
                      color: whiteColor,
                      padding: const EdgeInsets.all(10.0),
                      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Row(
                        //mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(50.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: CachedNetworkImage(
                                imageUrl:
                                    'https://source.unsplash.com/1600x900/?portrait',
                                fit: BoxFit.cover,
                                width: 50.0,
                                height: 50.0,
                              ),
                            ),
                          ),
                          Container(
                            width: screenSize.width - 70,
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        child: Text(
                                          "stevebowen".tr(),
                                          style: textBoldBlack,
                                        ),
                                      ),
                                      Container(
                                          child:Text(
                                        "gold member".tr(),
                                        style: TextStyle(
                                            fontSize: 12, color: greyColor2),
                                      )),
                                    ],
                                  ),
                                ),
                                Container(
                                    alignment: Alignment.centerRight,
                                    child: const Icon(
                                      Icons.arrow_forward_ios,
                                      color:
                                          CupertinoColors.lightBackgroundGray,
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
//                ListsMenu(
//                  title: "100 Point * Member",
//                  onPress: (){
//
//                  },
//                ),
                  ListsMenu(
                    title: "reviews".tr(),
                    icon: Icons.star,
                    backgroundIcon: Colors.cyan,
                    onPress: () {},
                  ),
                  ListsMenu(
                    title: "invitefriend".tr(),
                    icon: Icons.people,
                    backgroundIcon: primaryColor,
                    onPress: () {
                      Navigator.of(context).push(MaterialPageRoute<Null>(
                          builder: (BuildContext context) {
                            return InviteFriends();
                          },
                          fullscreenDialog: true));
                    },
                  ),
                  ListsMenu(
                    title: "noti".tr(),
                    icon: Icons.notifications_active,
                    backgroundIcon: primaryColor,
                    onPress: () {},
                  ),
                  ListsMenu(
                    title: "term&policy".tr(),
                    icon: Icons.description,
                    backgroundIcon: Colors.deepPurple,
                    onPress: () {},
                  ),
                  ListsMenu(
                    title: "contactus".tr(),
                    icon: Icons.help,
                    backgroundIcon: primaryColor,
                    onPress: () {},
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
