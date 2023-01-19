import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taxi_app_driver/theme/style.dart';
import 'package:flutter/services.dart';

class InviteFriends extends StatefulWidget {
  const InviteFriends({Key? key}) : super(key: key);

  @override
  _InviteFriendsState createState() => _InviteFriendsState();
}

class _InviteFriendsState extends State<InviteFriends> {
  final keyScaffold = GlobalKey<ScaffoldState>();

  void Mydialog()async{
    return showDialog(context:context ,
    builder: (_){
      return AlertDialog(
         title: Text("enteryouremail".tr()),
        
       content: TextField(
          decoration: InputDecoration(
            hintText:"seperatedwithcommas".tr()
          ),
        ),
         actions: [
          MaterialButton(
            child: Text("sendinvite".tr()),
            shape: StadiumBorder(),
            color: Colors.amber,
            onPressed: (){
Navigator.pop(context);
          }),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: whiteColor,
        title:Text('invitefriend'.tr(),style: TextStyle(color: blackColor),),
//        leading: IconButton(
//          icon: Icon(Icons.arrow_back_ios,color: blackColor,),
//          onPressed: () => Navigator.of(context).pushReplacement(
//              new MaterialPageRoute(builder: (context) => LoginScreen2())),
//        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(screenSize.width*0.13, 0.0, screenSize.width*0.13, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(100.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Container(
                      color: primaryColor,
                        height: 180.0,
                        width: 180.0,
                        child: const Icon(Icons.supervisor_account,color: blackColor,size: 100.0,)
                    )
                ),
              ),
            ),
            Text("invite".tr(),style: headingBlack,),
            Text("earnupto".tr(),style: heading18Black,),
            Container(
              padding: const EdgeInsets.only(bottom: 20.0,top: 20.0),
              child: Text("when your friend signup",
                style: textStyle,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: double.infinity,
              height: 45.0,
              decoration: BoxDecoration(
                color: greyColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: GestureDetector(
                  onLongPress: () {
                    Clipboard.setData(const ClipboardData(text: '09867656'));
                    
                  },
                  child: Text("09867656",
                    style: heading18Black,
                  ),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10.0),),
            ButtonTheme(
              height: 45.0,
              minWidth: MediaQuery.of(context).size.width,
              child: MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                elevation: 0.0,
                color: primaryColor,
                // icon: const Text(''),
                child: Text('Invite'.tr(), style: headingBlack,),
                onPressed: (){
                  Mydialog();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
