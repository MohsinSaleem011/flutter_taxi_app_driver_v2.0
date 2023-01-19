
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taxi_app_driver/Components/listile.dart';
import 'package:flutter_taxi_app_driver/Screen/Notification/model.dart';
import 'package:flutter_taxi_app_driver/Screen/widgets.dart';

Widget MyListile(Datum datum){
 return Padding(
   padding: const EdgeInsets.all(10),
   child: Container(
    decoration: BoxDecoration(
color: Colors.amber.withOpacity(0.7),
border: Border.all(color: Colors.black,width: 4),
borderRadius: BorderRadius.circular(10),
boxShadow:[BoxShadow(blurRadius: 2,
color: Colors.black.withOpacity(0.5),

)]

 ),
    
    child: Column(
      children: [
        Text(datum.id.toString(),style: ToListile(10, Colors.black)),
        SizedBox(height: 5,),
        Text(datum.userId.toString(),style: ToListile(10, Colors.black)),
        SizedBox(height: 5,),
        Text(datum.status.toString(),style: ToListile(10, Colors.black)),
        SizedBox(height: 5,),
        Text(datum.description.toString(),style: ToListile(10, Colors.black)),
        SizedBox(height: 5,),
        Text(datum.title.toString(),style: ToListile(10, Colors.black)),
        SizedBox(height: 5,),


        
      ],
    ),
   ),
 );

}