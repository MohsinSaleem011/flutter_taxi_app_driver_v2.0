import 'package:dio/dio.dart';
import 'dart:async';

import 'package:flutter_taxi_app_driver/config.dart';
import 'package:flutter_taxi_app_driver/data/Model/directions_google_map_response.dart';
import 'package:flutter_taxi_app_driver/data/Model/get_routes_request_model.dart';

class GoogleMapApiService {
  static const apiKey = Config.apiKey;
  static const url = 'https://maps.googleapis.com/maps/api/directions/json';
  // static final GMapClient _gmapClient = GMapClient();

  GoogleMapApiService();

  getHttp(String query) async {
    try {
      Response response = await Dio().get('$url?$query');
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future getDirectionsRoutes({required GetRouterRequest request}) async {
    try {
      Response response = await Dio().get('$url?origin=${request.origin!.latitude},${request.origin!.longitude}&destination=${request.destination!.latitude},${request.destination!.longitude}&key=${apiKey}&mode=${request.mode}');
      DirectionsGoogleMapResponse? responseData = DirectionsGoogleMapResponse.fromJson(response.data);
      return responseData;
    } catch (e) {
      print(e);
    }
  }
}
