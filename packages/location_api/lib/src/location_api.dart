import 'dart:async';

import 'package:geopoint/geopoint.dart';
import 'package:location/location.dart';

/// Exception thrown when fetching user location data fails or returns null.
class LocationRequestFailure implements Exception {}

/// {@template location_api}
/// {@endtemplate}
class LocationApi {
  final _locationClient = Location();

  /// Get users current [Location].
  Future<GeoPoint> getUserLocation() async {
    final _defaultLocation = GeoPoint(longitude: 0.1, latitude: 0.2);
    var locationServiceEnabled = await _locationClient.serviceEnabled();
    LocationData _locationData;

    if (locationServiceEnabled == false) {
      locationServiceEnabled = await _locationClient.requestService();
    }

    if (locationServiceEnabled == false) {
      return _defaultLocation;
    }

    try {
      _locationData = await _locationClient.getLocation();
    } catch (_) {
      throw LocationRequestFailure();
    }

    return GeoPoint(
      latitude: _locationData.latitude ?? 0.0,
      longitude: _locationData.longitude ?? 0.0,
    );
  }
}
