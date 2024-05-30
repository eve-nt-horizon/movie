import 'package:flutter_test/flutter_test.dart';
import 'package:movie/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('Login,signupViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
