import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:star_oven/map/bloc/map_bloc.dart';

class MockMapBloc extends MockBloc<MapEvent, MapState> implements MapBloc {}

void main() {
  group('MapBloc Test', () {
    MockMapBloc mapBloc;

    setUp(() {
      mapBloc = MockMapBloc();
    });

    // blocTest(
    //   'emits [] when nothing is added',
    //   build: () => mapBloc,
    //   expect: () => [MapStatus.initial],
    // );
  });
}
