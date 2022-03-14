import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location extends Equatable {
  const Location({
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  static const empty = Location(
    latitude: 1,
    longitude: 2,
  );

  final double latitude;
  final double longitude;

  @override
  List<Object> get props => [latitude, longitude];

  Map<String, dynamic> toJson() => _$LocationToJson(this);

  Location copyWith({
    double? latitude,
    double? longitude,
  }) {
    return Location(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}
