import 'package:flutter/material.dart';
import 'package:gallery/app.dart';
import 'package:gallery/core/di/service_locator.dart';

void main() {
  configureDependencies();

  runApp(const App());
}
