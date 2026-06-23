import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';

import 'app/di/injector.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  runZonedGuarded(() async => _initialize(builder), _handleError);
}

Future<void> _initialize(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  _initLogger();

  await setupDependencies();

  runApp(await builder());
}

void _initLogger() {
  Logger.root.level = kDebugMode ? Level.ALL : Level.INFO;
  Logger.root.onRecord.listen((record) {
    if (kDebugMode) {
      debugPrint('${record.level.name}: ${record.time}: ${record.message}');
    }
  });
}

void _handleError(Object error, StackTrace stack) {
  debugPrint('[bootstrap] ERROR: $error\n$stack');
}
