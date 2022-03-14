// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter_services_binding/flutter_services_binding.dart';
import 'package:star_oven/app/app.dart';
import 'package:star_oven/bootstrap.dart';

void main() {
  FlutterServicesBinding.ensureInitialized();
  bootstrap(() => const App());
}
