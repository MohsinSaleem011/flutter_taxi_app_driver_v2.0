import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taxi_app_driver/Screen/Menu/menu_screen.dart';
import 'package:flutter_taxi_app_driver/Screen/Notification/httpfile.dart';
import 'package:flutter_taxi_app_driver/Screen/Notification/item_notification.dart';
import 'package:flutter_taxi_app_driver/theme/style.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'detail.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'listtile.dart';
import 'model.dart';

class NotificationScreens extends StatefulWidget {
  @override
  _NotificationScreensState createState() => _NotificationScreensState();
}

class _NotificationScreensState extends State<NotificationScreens> {
  ApiServices client=ApiServices();
  final String screenName = "NOTIFICATIONS";

  List<Map<String, dynamic>> listNotification = [];

  navigateToDetail(String id){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotificationDetail(id: id,)));
  }

  dialogInfo(){
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: const Text("Confirm Delete"),
            content: const Text("Are you sure delete all notification ?"),
            actions: <Widget>[
              MaterialButton(
                  onPressed: (){Navigator.pop(context);},
                  child: Text('CANCEL',style: textGrey,)),
              MaterialButton(
                  onPressed: (){
                    setState(() {
                      listNotification.clear();
                    });
                    Navigator.pop(context);
                  },
                  child: const Text('OK')),
            ],
          );
        }
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listNotification = [
      {"id": '0',"title" : 'System',"subTitle" : "Flutter works with exiting code, is used by", "icon" : Icons.check_circle},
      {"id": '1',"title" : 'Promition',"subTitle" : "Invite friends - Get 3 coupons each!", "icon" : MdiIcons.camcorder},
      {"id": '2',"title" : 'Promition',"subTitle" : "Invite friends - Get 3 coupons each!", "icon" : MdiIcons.camcorder},
      {"id": '3',"title" : 'System',"subTitle" : "Booking #1223 has been cancelled!", "icon" : MdiIcons.cancel},
      {"id": '3',"title" : 'System',"subTitle" : "Thank you! Your trancastion is!", "icon" : Icons.check_circle},

    ];
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void removeNotification(BuildContext context, index) {
    setState(() {
      listNotification.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('noti'.tr(),style: TextStyle(color: blackColor),),
        backgroundColor: whiteColor,
        elevation: 2.0,
        iconTheme: const IconThemeData(color: blackColor),
        // actions: <Widget>[
        //   IconButton(
        //       icon: const Icon(Icons.restore_from_trash,color: blackColor,),
        //       onPressed: (){
        //         dialogInfo();
        //       }
        //   )
        // ]
      ),
      drawer: MenuScreens(activeScreenName: screenName),
        body:
        listNotification.isNotEmpty ?
        Scrollbar(
          child: ListView.builder(
              itemCount: listNotification.length,
              itemBuilder: (BuildContext context, int index){
                return Slidable(
                    endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            backgroundColor: const Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                            onPressed: (BuildContext context) {
                              removeNotification(context, index);
                            },
                          ),
                        ]
                    ),
                    child: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: greyColor,width: 1)
                            )
                        ),
                        child: GestureDetector(
                            onTap: (){
                              navigateToDetail(index.toString());
                            },
                            child: ItemNotification(
                              title: listNotification[index]['title'],
                              subTitle: listNotification[index]['subTitle'],
                              icon: listNotification[index]['icon'],
                            )
                        )
                    )
                );
              }
          ),
        ): SizedBox(
          height: screenSize.height,
          child: Center(
            child: Image.asset('assets/image/empty_state_trash_300.png',width: 100.0,),
          ),
        )
      //   body:FutureBuilder(future:client.getNotifications(),builder: (context,snapshot){
      //   if(snapshot!=null&&snapshot.hasData){
      //     var data = snapshot.data as List<Datum>?;
      //     return ListView.builder(
      //       itemCount: data?.length,
      //       itemBuilder: (contxet,index){
      //       return MyListile(data![index]);
      //     });
      //   }
      //   return Container();
      // }),
  
      
    );
  }
}
