import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_api/location_api.dart';
import 'package:star_oven/map/bloc/map_bloc.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => MapBloc(LocationApi()),
        child: BlocBuilder<MapBloc, MapState>(
          builder: (context, state) {
            final _centerLocation = state.currentLocation == null
                ? const LatLng(40.01734748360382, -89.03050260799887)
                : LatLng(
                    state.currentLocation!.latitude,
                    state.currentLocation!.longitude,
                  );
            final bloc = context.read<MapBloc>();
            if (state.status == MapStatus.success) {
              final _initialCameraPosition = CameraPosition(
                target: _centerLocation,
                zoom: 17,
              );
              return GoogleMap(initialCameraPosition: _initialCameraPosition);
            } else if (state.status == MapStatus.initial) {
              return Center(
                child: ElevatedButton(
                  onPressed: () => bloc.add(GetLocationRequested()),
                  child: const Text('Get Location'),
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
