part of 'map_bloc.dart';

enum MapStatus { initial, loading, success, failure }

extension LocationStatusX on MapStatus {
  bool get isInitial => this == MapStatus.initial;
  bool get isLoading => this == MapStatus.loading;
  bool get isSuccess => this == MapStatus.success;
  bool get isFailure => this == MapStatus.failure;
}

@JsonSerializable()
class MapState extends Equatable {
  const MapState({
    this.status = MapStatus.initial,
    this.currentLocation = const GeoPoint(
      latitude: 0.0,
      longitude: 0.0,
    ),
  });

  factory MapState.fromJson(Map<String, dynamic> json) =>
      _$MapStateFromJson(json);

  final MapStatus status;
  @GeoPointJsonConverter()
  final GeoPoint currentLocation;

  MapState copyWith({
    MapStatus? status,
    GeoPoint? currentLocation,
  }) {
    return MapState(
      status: status ?? this.status,
      currentLocation: currentLocation ?? this.currentLocation,
    );
  }

  Map<String, dynamic> toJson() => _$MapStateToJson(this);

  @override
  List<Object?> get props => [status, currentLocation];
}

class GeoPointJsonConverter implements JsonConverter<GeoPoint, GeoPoint> {
  const GeoPointJsonConverter();

  @override
  GeoPoint fromJson(GeoPoint value) => value;

  @override
  GeoPoint toJson(GeoPoint value) => value;
}
