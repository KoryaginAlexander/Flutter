import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'di.config.dart';

final getIt = GetIt.instance;

/// Регистрирует все зависимости, помеченные аннотациями
/// (@lazySingleton, @injectable), в контейнере GetIt. Вызывается один раз
/// из main() перед runApp(), поэтому ни одна зависимость не создаётся
/// вручную в UI-слое.
@InjectableInit()
void configureDependencies() => getIt.init();
