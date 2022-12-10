import 'package:flutter/material.dart';
import 'package:gallery/core/di/service_locator.dart';
import 'package:go_router/go_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final router = injector<GoRouter>();

    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
