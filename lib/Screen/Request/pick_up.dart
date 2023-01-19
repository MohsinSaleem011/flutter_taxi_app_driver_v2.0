import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taxi_app_driver/Screen/Request/steps_part_view.dart';
import 'package:flutter_taxi_app_driver/api_service/google_map_api_service.dart';
import 'package:flutter_taxi_app_driver/data/Model/directions_google_map_response.dart';
import 'package:flutter_taxi_app_driver/data/Model/get_routes_request_model.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../theme/style.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:io' show Platform;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../google_map_helper.dart';
import 'package:flutter_taxi_app_driver/Components/loading.dart';

import 'image_steps.dart';

class PickUp extends StatefulWidget {
  const PickUp({Key? key}) : super(key: key);

  @override
  _PickUpState createState() => _PickUpState();
}

class _PickUpState extends State<PickUp> {
  var googleMapApi = GoogleMapApiService();
  GoogleMapController? _mapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  Map<PolylineId, Polyline> polyLines = <PolylineId, Polyline>{};
  final int _polylineIdCounter = 1;
  PolylineId? selectedPolyline;
  bool checkPlatform = Platform.isIOS;

  LatLng currentLocation = const LatLng(39.155232, -95.473636);
  LatLng fromLocation = const LatLng(39.155232, -95.473636);
  LatLng toLocation = const LatLng(39.115153, -95.638949);

  String? distance, duration;
  List<Routes>? routesData;

  final GMapViewHelper _gMapViewHelper = GMapViewHelper();

  @override
  void initState() {
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    addMarker();
    getRouter();
  }


  addMarker(){
    const MarkerId _markerFrom = MarkerId("fromLocation");
    const MarkerId _markerTo = MarkerId("toLocation");
    markers[_markerFrom] = GMapViewHelper.createMaker(
      markerIdVal: "fromLocation",
      icon: checkPlatform ? "assets/image/gps_point_24.png" : "assets/image/gps_point.png",
      lat: fromLocation.latitude,
      lng: fromLocation.longitude,
      onTap: () {  },
    );

    markers[_markerTo] = GMapViewHelper.createMaker(
      markerIdVal: "toLocation",
      icon: checkPlatform ? "assets/image/ic_marker_32.png" : "assets/image/ic_marker_128.png",
      lat: toLocation.latitude,
      lng: toLocation.longitude,
      onTap: () {  },
    );
  }

  void getRouter() async {
    final String polylineIdVal = 'polyline_id_$_polylineIdCounter';
    final PolylineId polylineId = PolylineId(polylineIdVal);
    polyLines.clear();
    var router;

    DirectionsGoogleMapResponse? routerRes = await googleMapApi.getDirectionsRoutes(
      request: GetRouterRequest(
        origin: fromLocation,
        destination: toLocation,
        mode: "driving",
      ),
    );
    if (routerRes != null) {
      router = routerRes.routes![0].overviewPolyline!.points;
      routesData  = routerRes.routes;
    }
    distance = routesData![0].legs![0].distance!.text;
    duration = routesData![0].legs![0].duration!.text;

    polyLines[polylineId] = GMapViewHelper.createPolyline(
        polylineIdVal: polylineIdVal,
        router: router,
        formLocation: fromLocation,
        toLocation: toLocation,
    );
    setState(() {});
    _gMapViewHelper.cameraMove(fromLocation: fromLocation,toLocation: toLocation,mapController: _mapController!);
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _buildInfoLayer(),
          Positioned(
            top: 30.0,
            left: 0.0,
            child: _buildStepDirection(),
          )
        ],
      ),
    );
  }

  Widget _buildStepDirection(){
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: 50.0,
      width: screenSize.width,
      color: greenColor,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_upward,color: blackColor,),
            onPressed: (){
            },
          ),
          Container(
            padding: const EdgeInsets.only(left: 5.0,right: 5.0),
            child: Text("500mile".tr(),style: textBoldBlack,),
          ),
          Text("headsouth".tr(),style: textStyle,)
        ],
      ),
    );
  }

  Widget _buildInfoLayer(){
    final screenSize = MediaQuery.of(context).size;
    final maxHeight = 0.70*screenSize.height;
    const minHeight = 130.0;

    final panel =
    Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 30,
                height: 5,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: const BorderRadius.all(Radius.circular(12.0))),
              ),
            ],
          ),
          const SizedBox(
            height: 5.0,
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(duration ?? '',style: headingBlack,),
                        Text(' / \$ 29.00',style: headingPrimaryColor,)
                      ],
                    ),
                    Text(distance ?? '',style: textStyle,),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                },
                child: Container(
                  height: 40,
                  width: 40,
                  margin: const EdgeInsets.only(left: 10.0,right: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: primaryColor,
                  ),
//                    Icon(MdiIcons.directionsFork,),
                  child: const Icon(MdiIcons.directionsFork,color: whiteColor,),
                ),
              ),
              SizedBox(
                width: 70.0,
                child: ButtonTheme(
                  minWidth: 50,
                  height: 35.0,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                    elevation: 0.0,
                    color: redColor,
                    child: Text('exit'.tr().toUpperCase(),style: heading18,
                    ),
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              )
            ],
          ),
//          Container(
//            padding: EdgeInsets.only(top: 10.0),
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                GestureDetector(
//                  onTap: (){
//                    print("Reset");
//                  },
//                  child: Container(
//                    height: 40,
//                    width: 40,
//                    margin: EdgeInsets.only(left: 10.0,right: 10.0),
//                    decoration: BoxDecoration(
//                      borderRadius: BorderRadius.circular(50.0),
//                      color: primaryColor,
//                    ),
//                    child: Icon(Icons.arrow_back_ios,color: whiteColor,),
//                  ),
//                ),
//                GestureDetector(
//                  onTap: (){
//                    print("Reset");
//                  },
//                  child: Container(
//                    height: 40,
//                    width: 40,
//                    margin: EdgeInsets.only(left: 10.0,right: 10.0),
//                    decoration: BoxDecoration(
//                      borderRadius: BorderRadius.circular(50.0),
//                      color: primaryColor,
//                    ),
//                    child: Icon(Icons.arrow_forward_ios,color: whiteColor,),
//                  ),
//                ),
//              ],
//            ),
//          ),
          Container(
            padding: const EdgeInsets.only(top: 10.0),
            child: ButtonTheme(
              minWidth: screenSize.width ,
              height: 35.0,
              child: MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                elevation: 0.0,
        
                color: primaryColor,
                child: Text('dropoff'.tr().toUpperCase(),style: headingWhite,
                ),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PickUp()));
                },
              ),
            ),
          ),
          const Divider(),
          Expanded(
            child:
            routesData != null ?
            ListView.builder(
              shrinkWrap: true,
              itemCount: routesData![0].legs![0].steps!.length,
              itemBuilder: (BuildContext context, index){
                return StepsPartView(
                  instructions: routesData![0].legs![0].steps![index].htmlInstructions ?? '',
                  duration: routesData![0].legs![0].steps![index].duration!.text ?? '',
                  imageManeuver: getImageSteps(routesData![0].legs![0].steps![index].maneuver),
                );
              },
            ): const LoadingBuilder(),
          )
        ],
      )
    );

    return SlidingUpPanel(
      maxHeight: maxHeight,
      minHeight: minHeight,
      parallaxEnabled: true,
      parallaxOffset: .5,
      panel: panel,
      body: _buildMapLayer(),
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0)),
      onPanelSlide: (double pos) => setState(() {
      }),
    );
  }

  Widget _buildMapLayer(){
    return currentLocation == null ?
      const Center(child: CupertinoActivityIndicator())
        : SizedBox(
            height: MediaQuery.of(context).size.height,
            child: _gMapViewHelper.buildMapView(
              context: context,
              onMapCreated: _onMapCreated,
              currentLocation: currentLocation,
              markers: markers,
              polyLines: polyLines,
              onTap: (_){

              }
            ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
