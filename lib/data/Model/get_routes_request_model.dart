import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:convert';

GetRouterRequest getRouterRequestFromJson(String str) => GetRouterRequest.fromJson(json.decode(str));

// String getRouterRequestToJson(GetRouterRequest data) => json.encode(data.toJson());

class GetRouterRequest {
  GetRouterRequest({
    this.origin,
    this.destination,
    this.mode,
  });

  LatLng? origin;
  LatLng? destination;
  String? mode;

  factory GetRouterRequest.fromJson(Map<String, dynamic> json) => GetRouterRequest(
    origin: json["origin"] == null ? null : LatLng.fromJson(json["origin"]),
    destination: json["destination"] == null ? null : LatLng.fromJson(json["destination"]),
    mode: json["mode"] == null ? null : json["mode"],
  );

  // Map<String, dynamic> toJson() => {
  //   "origin": origin == null ? null : origin,
  //   "destination": destination == null ? null : destination,
  //   "mode": mode == null ? null : mode,
  // };
}
