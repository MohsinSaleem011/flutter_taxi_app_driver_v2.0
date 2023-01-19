import 'package:flutter/material.dart';
import 'package:flutter_taxi_app_driver/theme/style.dart';

class NotificationDetail extends StatefulWidget {

  final String id;

  const NotificationDetail({Key? key, required this.id}) : super(key: key);

  @override
  _NotificationDetailState createState() => _NotificationDetailState();
}

class _NotificationDetailState extends State<NotificationDetail> {

  @override
  void initState() {
    super.initState();
  }

  dialogInfo(){
    return AlertDialog(
      title: const Text("Information"),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
      ),
      content: const Text('Delete successful'),
      actions: <Widget>[
        MaterialButton(
          child: const Text('Ok'),
          onPressed: (){
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Notification Detail',style: TextStyle(color: blackColor),),
          backgroundColor: whiteColor,
          elevation: 2.0,
          iconTheme: const IconThemeData(color: blackColor),
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.restore_from_trash,color: blackColor,),
                onPressed: (){
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return dialogInfo();
                      }
                  );
                }
            )
          ]
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  height: 220.0,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill, image: AssetImage('assets/image/news.jpg')
                      )
                  ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "CDC",
                      style: textBoldBlack,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: const Icon(
                        Icons.access_time,
                        size: 20.0,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                        child: Text(
                          "1h ago",
                          style: textBoldBlack,
                        )),
                    GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  width: 1.0,
                                  color: secondary),
                            )),
                        child: Text(
                          "ENVIRONMENT",
                          style: textStyleActive,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
                child: Text("Flutter is Google's mobile app SDK for crafting high-quality native interfaces on iOS and Android in record time",style: heading18Black,),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
                child: Text(
                  "Flutter is Google's mobile app SDK for crafting high-quality native interfaces on iOS and Android in record time. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source."
                      "We want to enable designers to deliver their full creative vision without being forced to water it down due to limitations of the underlying framework. Flutter's layered architecture gives you control over every pixel on the screen, and its powerful compositing capabilities let you overlay and animate graphics, video, text and controls without limitation. Flutter includes a full set of widgets that deliver pixel-perfect experiences on both iOS and Android.",
                  style: textStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
