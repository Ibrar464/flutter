import 'dart:async';

import 'package:car_rental_app/core/app_export.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class TrackYourRideController extends GetxController {
  RxBool isLoading = false.obs;

  MapType currentMapType = MapType.normal;

  Completer<GoogleMapController> googlecontroller = Completer();

  void onMapCreated(GoogleMapController controller) {
    googlecontroller.complete(controller);
  }

  @override
  void onInit() async {
    if (kDebugMode) {
      print("=======================================");
    }
    getLocation();
    super.onInit();
  }

  Location location = Location();
  bool? _serviceEnabled = false;
  LocationData? locationData;
  getLocation() async {
    isLoading.value = true;
    locationData = await Location().getLocation();
    if (kDebugMode) {
      print("-=-=-=-=--=-=-=-=-");
      print(locationData!.latitude);
      print(locationData!.longitude);
    }

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled!) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled!) {
        return;
      }
    }

    PermissionStatus? _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }
}
