// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter_test/flutter_test.dart';
import 'package:star_oven/app/app.dart';
import 'package:star_oven/map/view/map_view.dart';

import '../../helpers/hydrated_bloc.dart';

void main() {
  group('App', () {
    testWidgets('renders WeatherAppView', (tester) async {
      await mockHydratedStorage(() async {
        await tester.pumpWidget(const App());
      });
      expect(find.byType(MapPage), findsOneWidget);
    });
  });
}
