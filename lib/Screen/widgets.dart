 import 'package:flutter/cupertino.dart';
import 'package:flutter_taxi_app_driver/theme/style.dart';

import '../theme/button.dart';

Mylistile(IconData icon, String date, String title, String balance){
  return Container(
      padding: EdgeInsets.only(
          top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 253, 252, 250),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Color(0x88999999),
              offset: Offset(0, 5),
              blurRadius: 5.0,
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 50.0,
            width: 50.0,
            decoration: const BoxDecoration(
              color: Color(0xFFFFD428),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: Icon(icon, color: whiteColor, size: 30.0,),
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(title, style: textBoldBlack,)
                ),
                Container(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(date, style: textGrey,)
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(balance, style: heading18Black,)
            ),
          ),
        ],
      ),
    );
 }