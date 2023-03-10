import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taxi_app_driver/Screen/MyProfile/my_profile.dart';
import '../../theme/style.dart';
import 'chart.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: backgroundColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.mode_edit),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute<Null>(
                  builder: (BuildContext context) {
                    return MyProfile();
                  },
              ));
            },
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Container(
          color: backgroundColor,
          child: Column(
            children: <Widget>[
              Center(
                child: Stack(
                  children: <Widget>[
                    Material(
                      elevation: 10.0,
                      color: Colors.white,
                      shape: CircleBorder(),
                      child: Padding(
                        padding: EdgeInsets.all(2.0),
                        child: SizedBox(
                          height: 150,
                          width: 150,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.transparent,
                            backgroundImage: CachedNetworkImageProvider(
                              "https://source.unsplash.com/1600x900/?portrait",
                            )
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10.0,
                      left: 25.0,
                      height: 15.0,
                      width: 15.0,
                      child: Container(
                        width: 15.0,
                        height: 15.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: greenColor,
                            border: Border.all(
                                color: Colors.white, width: 2.0)),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.only(top: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "mr salah b".tr(),
                      style: TextStyle( color: blackColor,fontSize: 35.0),
                    ),
                    Text(
                      "clientsince".tr(),
                      style: TextStyle( color: blackColor, fontSize: 13.0),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                color: whiteColor,
                child: LineChartWallet(),
              ),
              SizedBox(height: 20),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 50,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        border: Border(
                          bottom: BorderSide(width: 1.0,color: backgroundColor)
                        )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('username'.tr(),style: textStyle,),
                          Text("mr salah b".tr(),style: textGrey,)
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: whiteColor,
                          border: Border(
                              bottom: BorderSide(width: 1.0,color: backgroundColor)
                          )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('phonenumber'.tr(),style: textStyle,),
                          Text("7665-554-2983",style: textGrey,)
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: whiteColor,
                          border: Border(
                              bottom: BorderSide(width: 1.0,color: backgroundColor)
                          )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('emial'.tr(),style: textStyle,),
                          Text("earl23@gmail.com",style: textGrey,)
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: whiteColor,
                          border: Border(
                              bottom: BorderSide(width: 1.0,color: backgroundColor)
                          )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('birthday'.tr(),style: textStyle,),
                          Text("Apirl 27, 1996",style: textGrey,)
                        ],
                      ),
                    ),
                  ],
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
