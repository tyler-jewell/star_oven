import 'dart:async';

import 'package:location/location.dart';

/// Exception thrown when fetching user location data fails or returns null.
class LocationRequestFailure implements Exception {}

/// Exception thrown if a error occurs while getting the user location.
class LocationServicesFailure implements Exception {}

/// {@template location_api}
/// {@endtemplate}
class LocationApi {
  /// {@macro location_api}
  LocationApi();

  final Location _locationClient = Location();

  /// Get users current [Location].
  Future<LocationData> getUserLocation() async {
    var locationServiceEnabled = await _locationClient.serviceEnabled();
    LocationData _locationData;

    if (locationServiceEnabled == false) {
      locationServiceEnabled = await _locationClient.requestService();
      if (locationServiceEnabled == false) {
        throw LocationServicesFailure();
      }
    }

    try {
      _locationData = await _locationClient.getLocation();
    } catch (_) {
      throw LocationRequestFailure();
    }

    return _locationData;
  }
}
