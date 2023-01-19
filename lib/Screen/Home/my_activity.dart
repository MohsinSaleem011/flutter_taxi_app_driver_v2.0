import 'package:flutter/material.dart';
import '../../theme/style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';

class MyActivity extends StatelessWidget {

  final String userImage;
  final String userName;
  final String level;
  final String totalEarned;
  final String hoursOnline;
  final String totalDistance;
  final String totalJob;

  const MyActivity(
      {Key? key,
        required this.userImage,
        required this.userName,
        required this.level,
        required this.totalEarned,
        required this.hoursOnline,
        required this.totalDistance,
        required this.totalJob,

      })
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: whiteColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: CachedNetworkImage(
                  imageUrl: userImage,
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
                    Text(userName,
                      style: textBoldBlack,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(level,
                      style: textGrey,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(totalEarned.toString(),
                      style: textBoldBlack,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text('earn'.tr(),
                      style: textGrey,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: primaryColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Icon(Icons.access_time, color: greyColor,),
                    Text(hoursOnline.toString(),style: heading18,),
                     Text('hour'.tr(),style: TextStyle(
                      fontSize: 11,
                      color: greyColor,
                    ),),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Icon(Icons.poll,color: greyColor,),
                    Text(totalDistance,style: heading18,),
                    Text('totaldistanc'.tr(),style: TextStyle(
                      fontSize: 11,
                      color: greyColor,
                    ),),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Icon(Icons.content_paste,color: greyColor,),
                    Text(totalJob.toString(),style: heading18,),
                    Text('totaljob'.tr(),style: TextStyle(
                      fontSize: 11,
                      color: greyColor,
                    ),),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
