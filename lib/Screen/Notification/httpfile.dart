import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'model.dart';
class ApiServices{

  var endURL=Uri.parse("https://giro.stepinnsolution.com/api/notifications");

  Future<List<Datum>?> getNotifications() async{
    var res= await http.get(endURL);
    if(res.statusCode==200){
      var data= notificationsFromJson(res.body);
      // Map<String , dynamic> json=jsonDecode(res.body);
      // List<dynamic> body= json['datum'];
      // List<Datum> datum=
      // body.map((dynamic e) => Datum.fromJson(e) ).toList();
     return data.data;
    }
    else{
      throw ("Can't get a Notifications");
    }
  }
}