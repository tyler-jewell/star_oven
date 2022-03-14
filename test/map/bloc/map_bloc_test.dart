import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:location/location.dart';
import 'package:location_api/location_api.dart';
import 'package:mocktail/mocktail.dart';
import 'package:star_oven/map/bloc/map_bloc.dart';

class MockMapBloc extends MockBloc<MapEvent, MapState> implements MapBloc {}

class MockLocationApi extends Mock implements LocationApi {}

void main() {
  final userLocation = LocationData.fromMap(<String, double>{
    'latitude': 1.0,
    'longitude': 2.0,
  });
  group(
    'MapBloc Test',
    () {
      late LocationApi locationApi;

      setUp(() {
        locationApi = MockLocationApi();
      });

      blocTest<MapBloc, MapState>(
        'should emit initial state',
        setUp: () {
          when(locationApi.getUserLocation)
              .thenAnswer((_) async => userLocation);
        },
        build: () => MapBloc(locationApi),
        act: (bloc) => bloc.add(GetLocationRequested()),
        expect: () => [
          MapState(
            status: MapStatus.success,
            location: Location(
              latitude: userLocation.latitude,
              longitude: userLocation.longitude,
            ),
          )
        ],
      );
    },
  );
}
