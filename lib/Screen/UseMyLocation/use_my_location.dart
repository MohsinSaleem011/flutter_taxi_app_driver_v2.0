import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taxi_app_driver/Components/button_view.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../theme/style.dart';

class UseMyLocation extends StatefulWidget {
  const UseMyLocation({Key? key}) : super(key: key);

  @override
  _UseMyLocationState createState() => _UseMyLocationState();
}

class _UseMyLocationState extends State<UseMyLocation> with TickerProviderStateMixin{
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );
  late final Animation fadeAnimation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  Map<Permission, PermissionStatus>? permissions;
  Map<Permission, PermissionStatus>? permissionRequestResult;
  bool isGrantedLocation = false;

  @override
  void initState(){
    super.initState();
  }

  Future<void> requestPermission() async {
    isGrantedLocation = await Permission.location.request().isGranted;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: whiteColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/image/6409.jpg",height: 200.0,),
                  const SizedBox(height: 30),
                  Text('enableyourlocation'.tr(), style: heading35Black,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 60.0, right: 60.0),
                    child: Text('chooseyourlocation'.tr(),
                      style: textStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height:30),
                  ButtonView(
                    title: 'usemylocation'.tr().toUpperCase(),
                    onPressed: () {
                      requestPermission().then((_){
                        Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
                      });
                    }
                  ),
                  const SizedBox(height:20),
                  InkWell(
                    onTap: (){
                      // requestPermission().then((_){
                      //
                      // });
                      Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
                    },
                    child: Text('skipfornow'.tr(),style: textGrey,),
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

}
