import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taxi_app_driver/Components/ink_well_custom.dart';
import 'package:flutter_taxi_app_driver/Screen/Message/message_screen.dart';
import 'package:flutter_taxi_app_driver/theme/style.dart';
import 'pick_up.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RequestDetail extends StatefulWidget {
  const RequestDetail({Key? key}) : super(key: key);


  @override
  _RequestDetailState createState() => _RequestDetailState();
}

class _RequestDetailState extends State<RequestDetail> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String? yourReview;
  double? ratingScore;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('requestdetail'.tr(), style: TextStyle(color: blackColor),
        ),
        backgroundColor: whiteColor,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: blackColor),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(left: 10.0,right: 10.0),
        child: ButtonTheme(
          minWidth: screenSize.width ,
          height: 45.0,
          child: MaterialButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            elevation: 0.0,
            color: primaryColor,
            child: Text('gotopickup'.tr().toUpperCase(),style: headingWhite,
            ),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PickUp()));
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: InkWellCustom(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Container(
            color: greyColor,
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: const BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      )
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: CachedNetworkImage(
                          imageUrl: 'https://source.unsplash.com/1600x900/?portrait',
                          fit: BoxFit.cover,
                          width: 40.0,
                          height: 40.0,
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('olivianastya'.tr(),style: textBoldBlack,),
                            Text("08 Jan 2019 at 12:00 PM", style: textGrey,),
                            Row(
                              children: <Widget>[
                                Container(
                                  height: 25.0,
                                  padding: const EdgeInsets.all(5.0),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: primaryColor
                                  ),
                                  child: Text('applepay'.tr(),style: textBoldWhite,),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  height: 25.0,
                                  padding: const EdgeInsets.all(5.0),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: primaryColor
                                  ),
                                  child: Text('discount'.tr(),style: textBoldWhite,),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text("\$ 250.0",style: textBoldBlack,),
                            Text("2.2 Km",style: textGrey,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: whiteColor,
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("pickup".tr().toUpperCase(),style: textGreyBold,),
                            Text("2536flyingtaxicabs".tr(),style: textStyle,),

                          ],
                        ),
                        const Divider(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("dropoff".tr().toUpperCase(),style: textGreyBold,),
                            Text("2536flyingtaxicabs".tr(),style: textStyle,),

                          ],
                        ),
                        const Divider(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("note".tr().toUpperCase(),style: textGreyBold,),
                            Text("lorem Ipsum".tr(),style: textStyle,),
                          ],
                        ),
                      ],
                    )
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5.0,bottom: 5.0),
                  padding: const EdgeInsets.all(10),
                  color: whiteColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("billdetils".tr().toUpperCase(), style: textGreyBold,),
                      Container(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("ridefare".tr(), style: textStyle,),
                            Text("\$10.99", style: textBoldBlack,),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("taxes".tr(), style: textStyle,),
                            Text("\$1.99", style: textBoldBlack,),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("discount".tr(), style: textStyle,),
                            Text("- \$5.99", style: textBoldBlack,),
                          ],
                        ),
                      ),
                      Container(
                        width: screenSize.width - 50.0,
                        height: 1.0,
                        color: Colors.grey.withOpacity(0.4),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("totalbill".tr(), style: heading18Black,),
                            Text("\$7.49", style: heading18Black,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: whiteColor,
                  padding: const EdgeInsets.only(top: 10.0,bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                        },
                        child: Container(
                          height: 60,
                          width: 100,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.call,color: whiteColor,),
                              Text('call'.tr(),style: TextStyle(fontSize: 18,color: whiteColor,fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute<void>(
                              builder: (BuildContext context) {
                                return ChatScreen();
                              },
                              fullscreenDialog: true));

                        },
                        child: Container(
                          height: 60,
                          width: 100,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.mail,color: whiteColor,),
                              Text('message'.tr(),style: TextStyle(fontSize: 18,color: whiteColor,fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){

                        },
                        child: Container(
                          height: 60,
                          width: 100,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: greyColor2,
                              borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.delete,color: whiteColor,),
                              Text('cancel'.tr(),style: TextStyle(fontSize: 18,color: whiteColor,fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
