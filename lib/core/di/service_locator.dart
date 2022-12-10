import 'package:gallery/core/di/service_locator.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final injector = GetIt.I;

@InjectableInit()
void configureDependencies() => injector.init();
