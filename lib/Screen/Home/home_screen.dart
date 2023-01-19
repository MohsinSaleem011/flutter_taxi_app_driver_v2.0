import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taxi_app_driver/Components/item_request.dart';
import 'package:flutter_taxi_app_driver/Screen/Home/my_activity.dart';
import 'package:flutter_taxi_app_driver/Screen/Request/request_detail.dart';
import 'package:flutter_taxi_app_driver/api_service/google_map_api_service.dart';
import 'package:flutter_taxi_app_driver/data/Model/directions_google_map_response.dart';
import 'package:flutter_taxi_app_driver/data/Model/get_routes_request_model.dart';
import 'package:flutter_taxi_app_driver/theme/style.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/services.dart';
import 'package:flutter_taxi_app_driver/Screen/Menu/menu_screen.dart';
import 'package:flutter_taxi_app_driver/data/Model/place_item.dart';
import 'dart:io' show Platform;
import 'package:flutter/services.dart' show rootBundle;
import 'package:permission_handler/permission_handler.dart';
import 'package:tcard/tcard.dart';
import 'radio_select_map_type.dart';
import 'package:flutter_taxi_app_driver/data/Model/map_type_model.dart';
import '../../google_map_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final String screenName = "HOME";
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};
  Map<PolylineId, Polyline> polyline = <PolylineId, Polyline>{};

  CircleId? selectedCircle;
  GoogleMapController? _mapController;

  String? currentLocationName;
  String? newLocationName;
  GoogleMapController? mapController;
  PlaceItemRes? fromAddress;
  PlaceItemRes? toAddress;
  bool checkPlatform = Platform.isIOS;
  String? distance;
  String? duration;
  bool nightMode = false;
  VoidCallback? showPersBottomSheetCallBack;
  List<MapTypeModel> sampleData = [];
  PersistentBottomSheetController? _controller;
  List<Map<String, dynamic>> listRequest = [];
  final GMapViewHelper _gMapViewHelper = GMapViewHelper();
  PolylineId? selectedPolyline;
  bool isShowDefault = false;
  Position? currentLocation;
  Position? _lastKnownPosition;
  bool isEnabledLocation = false;

  final Geolocator _locationService = Geolocator();
  PermissionStatus? permission;
  var googleMapApi = GoogleMapApiService();

  @override
  void initState() {
    super.initState();
    showPersBottomSheetCallBack = _showBottomSheet;
    sampleData.add(MapTypeModel(1,true, 'assets/style/maptype_nomal.png', 'Nomal', 'assets/style/nomal_mode.json'));
    sampleData.add(MapTypeModel(2,false, 'assets/style/maptype_silver.png', 'Silver', 'assets/style/sliver_mode.json'));
    sampleData.add(MapTypeModel(3,false, 'assets/style/maptype_dark.png', 'Dark', 'assets/style/dark_mode.json'));
    sampleData.add(MapTypeModel(4,false, 'assets/style/maptype_night.png', 'Night', 'assets/style/night_mode.json'));
    sampleData.add(MapTypeModel(5,false, 'assets/style/maptype_netro.png', 'Netro', 'assets/style/netro_mode.json'));
    sampleData.add(MapTypeModel(6,false, 'assets/style/maptype_aubergine.png', 'Aubergine', 'assets/style/aubergine_mode.json'));

    listRequest = [
      {"id": 'id0'.tr(),
        "avatar" : "https://source.unsplash.com/1600x900/?portrait",
        "userName" : 'nam0'.tr(),
        "date" : 'date0'.tr(),
        "price" : 'price0'.tr(),
        "distance" :'distance0'.tr() ,
        "addFrom": 'addfrom0'.tr(),
        "addTo" : 'addTo0'.tr(),
        "locationForm" : const LatLng(42.535003,-71.873626),
        "locationTo" : const LatLng(42.551746, -71.958439),
      },
      { "id": 'id1'.tr(),
        "avatar" : "https://source.unsplash.com/1600x900/?portrait",
        "userName" :  'nam1'.tr(),
        "date" : 'date1'.tr(),
        "price" : 'price1'.tr(),
        "distance" : 'distance1'.tr(),
        "addFrom": 'addfrom1'.tr(),
        "addTo" : 'addTo1'.tr(),
        "locationForm" : const LatLng(42.557152,-72.023708),
        "locationTo" : const LatLng(42.460815, -72.203673),
      },
      {"id": 'id2'.tr(),
        "avatar" : "https://source.unsplash.com/1600x900/?portrait",
        "userName" : 'nam2'.tr(),
        "date" : 'date2'.tr(),
        "price" : 'price2'.tr(),
        "distance" : 'distance2'.tr(),
        "addFrom":'addfrom2'.tr(),
        "addTo" : 'addTo1'.tr(),
        "locationForm" : const LatLng(42.305444,-72.201658),
        "locationTo" : const LatLng(42.327784, -71.953803),
      },

    ];
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> checkPermission() async {
    isEnabledLocation = await Permission.location.serviceStatus.isEnabled;
  }

  void moveCameraToMyLocation(){
    _mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(currentLocation!.latitude,currentLocation!.longitude),
          zoom: 17.0,
        ),
      ),
    );
  }


  void _onMapCreated(GoogleMapController controller) async {
    _mapController = controller;
    addMarker(listRequest[0]['locationForm'], listRequest[0]['locationTo']);
  }

  Future<String> _getFileData(String path) async {
    return await rootBundle.loadString(path);
  }

  void _setMapStyle(String mapStyle) {
    setState(() {
      nightMode = true;
      _mapController!.setMapStyle(mapStyle);
    });
  }

  void changeMapType(int id, String fileName){
    print(fileName);
    if (fileName == null) {
      setState(() {
        nightMode = false;
        _mapController!.setMapStyle(null);
      });
    } else {
      _getFileData(fileName).then(_setMapStyle);
    }
  }

  void _showBottomSheet() async {
    setState(() {
      showPersBottomSheetCallBack = null;
    });
    _controller = _scaffoldKey.currentState!.showBottomSheet((context) {
      return SizedBox(
        height: 300.0,
        child: ListView(
          children:[ Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text('maptype0'.tr(),style: heading18Black,),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close,color: blackColor,),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
                Expanded(
                  child:
                  GridView.builder(
                    itemCount: sampleData.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        highlightColor: primaryColor,
                        splashColor: Colors.blueAccent,
                        onTap: () {
                          _closeModalBottomSheet();
                          for (var element in sampleData) {
                            element.isSelected = false;
                          }
                          sampleData[index].isSelected = true;
                          changeMapType(sampleData[index].id, sampleData[index].fileName);
        
                        },
                        child: MapTypeItem(sampleData[index]),
                      );
                    },
                  ),
                )
        
              ],
            ),
          ),]
        )
      );
    });
  }

  void _closeModalBottomSheet() {
    if (_controller != null) {
      _controller!.close();
      _controller = null;
    }
  }

  addMarker(LatLng locationForm, LatLng locationTo) {
    _markers.clear();
    const MarkerId _markerFrom = MarkerId("fromLocation");
    const MarkerId _markerTo = MarkerId("toLocation");
    _markers[_markerFrom] = GMapViewHelper.createMaker(
      markerIdVal: "fromLocation",
      icon: checkPlatform ? "assets/image/gps_point_24.png" : "assets/image/gps_point.png",
      lat: locationForm.latitude,
      lng: locationForm.longitude,
      onTap: (){}
    );

    _markers[_markerTo] = GMapViewHelper.createMaker(
      markerIdVal: "toLocation",
      icon: checkPlatform ? "assets/image/ic_marker_32.png" : "assets/image/ic_marker_128.png",
      lat: locationTo.latitude,
      lng: locationTo.longitude,
      onTap: (){}
    );
    _gMapViewHelper.cameraMove(fromLocation: locationForm,toLocation: locationTo,mapController: _mapController!);
    getRouter(locationForm, locationTo);
  }

  void getRouter(LatLng locationForm, LatLng locationTo) async {
    const String polylineIdVal = 'polyline_id';
    const PolylineId polylineId = PolylineId(polylineIdVal);
    polyline.clear();
    var router;

    DirectionsGoogleMapResponse? routerData = await googleMapApi.getDirectionsRoutes(
      request: GetRouterRequest(
        origin: locationForm,
        destination: locationTo,
        mode: "driving",
        ),
    );
    if (routerData != null) {
      router = routerData.routes![0].overviewPolyline!.points;
    }
    distance = routerData!.routes![0].legs![0].distance!.text;
    duration = routerData.routes![0].legs![0].duration!.text;

    polyline[polylineId] = GMapViewHelper.createPolyline(
      polylineIdVal: polylineIdVal,
      router: router,
      formLocation: locationForm,
      toLocation: locationTo,
    );
    setState(() {});
    _gMapViewHelper.cameraMove(fromLocation: locationForm,toLocation: locationTo, mapController: _mapController!);
  }

  onChangeCard(index, item) {
    setState(() {
      if(index == listRequest.length-1){
        setState(() {
          isShowDefault = true;
        });
      }else{
        addMarker(listRequest[index+1]['locationForm'], listRequest[index+1]['locationTo']);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    List<Widget> cards = List.generate(
      listRequest.length,
          (int index) {
        return WillPopScope(
          onWillPop:() => _ONBackbuttonPressed(context),
          child: ListView(
            children:[ Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 17),
                    blurRadius: 23.0,
                    spreadRadius: -13.0,
                    color: Colors.black54,
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: ItemRequest(
                  avatar: listRequest[index]['avatar'],
                  userName: listRequest[index]['userName'],
                  date: listRequest[index]['date'],
                  price: listRequest[index]['price'].toString(),
                  distance: listRequest[index]['distance'],
                  addFrom: listRequest[index]['addFrom'],
                  addTo: listRequest[index]['addTo'],
                  locationForm: listRequest[index]['locationForm'],
                  locationTo: listRequest[index]['locationTo'],
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RequestDetail()));
                  },
                )
              ),
            ),],
          ),
        );
      },
    );

    return Scaffold(
        key: _scaffoldKey,
        drawer: MenuScreens(activeScreenName: screenName),
        body: Container(
            color: whiteColor,
            child: Stack(
              children: <Widget>[
                _buildMapLayer(),
                Positioned(
                  bottom: isShowDefault == false ? 330 : 250,
                  right: 16,
                  child: Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(100.0),),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.my_location,size: 20.0,color: blackColor,),
                      onPressed: (){
                      },
                    ),
                  )
                ),
                Positioned(
                  top: 50,
                  right: 10,
                  child: Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(100.0),),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.layers,size: 20.0,color: blackColor,),
                      onPressed: (){
                        _showBottomSheet();
                      },
                    ),
                  )
                ),
                Positioned(
                    top: 50,
                    left: 10,
                    child: Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(100.0),),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.menu,size: 20.0,color: blackColor,),
                        onPressed: (){
                          _scaffoldKey.currentState!.openDrawer();
                        },
                      ),
                    )
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: isShowDefault == false ?
                    TCard(
                      size: Size(screenSize.width, 280),
                      cards: cards,
                      onForward: (index, info) {
                        onChangeCard(index, info);
                      },
                      onBack: (index, info) {
                        onChangeCard(index, info);
                      },
                      onEnd: () {
                        setState(() {
                          isShowDefault = true;
                        });
                      },
                    ) :  MyActivity(
                    userImage: 'https://source.unsplash.com/1600x900/?portrait',
                    userName: 'nam3'.tr(),
                    level: 'level'.tr(),
                    totalEarned: 'earned'.tr(),
                    hoursOnline: 'onlinehoure'.tr(),
                    totalDistance: 'tdistance'.tr(),
                    totalJob: 'tjob'.tr(),
                  ),
                )
              ],
            ),
        ),
    );
  }

  getLatCurrent() {
    if (currentLocation != null) {
      return currentLocation!.latitude;
    } else if (_lastKnownPosition != null) {
      return _lastKnownPosition!.latitude;
    } else {
      return 36.2844557;
    }
  }

  getLongCurrent() {
    if (currentLocation != null) {
      return currentLocation!.longitude;
    } else if (_lastKnownPosition != null) {
      return _lastKnownPosition!.longitude;
    } else {
      return -100.6933908;
    }
  }

  Widget _buildMapLayer(){
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: _gMapViewHelper.buildMapView(
          context: context,
          onMapCreated: _onMapCreated,
          currentLocation: LatLng(
              getLatCurrent(),
              getLongCurrent()
          ),
          markers: _markers,
          polyLines: polyline,
          onTap: (_){
          }
      ),
    );
  }
  
 Future<bool> _ONBackbuttonPressed(BuildContext context)async {
    bool exitApp= await showDialog(context: context, builder: (BuildContext context){
    return AlertDialog(
      title:  Text('Realy'.tr()),
      content: Text('doyouwant'.tr()),
      actions: [
        TextButton(onPressed: (){
          Navigator.of(context).pop(false);
        }, child: Text('no'.tr())),
        TextButton(onPressed: (){
          Navigator.of(context).pop(true);
        }, child: Text('yes'.tr()))
      ],
    );
    
    });
    return exitApp ?? false;
  }
}
