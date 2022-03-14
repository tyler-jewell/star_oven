import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:star_oven/map/bloc/map_bloc.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => MapBloc(),
        child: BlocBuilder<MapBloc, MapState>(
          builder: (context, state) {
            final bloc = context.read<MapBloc>();
            if (state.status == MapStatus.success) {
              final _initialCameraPosition = CameraPosition(
                target: LatLng(
                  state.location.latitude,
                  state.location.longitude,
                ),
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
