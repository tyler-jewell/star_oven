import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:location_api/location_api.dart';
import 'package:star_oven/map/model/location.dart';

part 'map_bloc.g.dart';
part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends HydratedBloc<MapEvent, MapState> {
  MapBloc() : super(const MapState()) {
    on<GetLocationRequested>(_onLocationRequested);
  }

  @override
  MapState fromJson(Map<String, dynamic> json) => MapState.fromJson(json);

  @override
  Map<String, dynamic> toJson(MapState state) => state.toJson();

  Future<void> _onLocationRequested(
    GetLocationRequested event,
    Emitter<MapState> emit,
  ) async {
    emit(state.copyWith(status: MapStatus.loading));

    final locationApi = LocationApi();

    final locationData = await locationApi.getUserLocation();

    emit(
      state.copyWith(
        status: MapStatus.success,
        location: Location(
          latitude: locationData.latitude!,
          longitude: locationData.longitude!,
        ),
      ),
    );
  }
}
