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
    Location? location,
  }) : location = location ?? Location.empty;

  factory MapState.fromJson(Map<String, dynamic> json) =>
      _$MapStateFromJson(json);

  final MapStatus status;
  final Location location;

  MapState copyWith({
    MapStatus? status,
    Location? location,
  }) {
    return MapState(
      status: status ?? this.status,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toJson() => _$MapStateToJson(this);

  @override
  List<Object?> get props => [status, location];
}
