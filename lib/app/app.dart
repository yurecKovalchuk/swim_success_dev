import 'package:flutter/material.dart';
import 'package:swim_success_dev/app/app_router/app_router.dart';
import 'package:swim_success_dev/app/di/injector.dart';

class SwimSuccessApp extends StatelessWidget {
  const SwimSuccessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Swim Success',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      routerConfig: getIt<AppRouter>().config(),
    );
  }
}
