// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pr8_app/data/archiver_database.dart' as _i229;
import 'package:pr8_app/data/archivers_repository.dart' as _i407;
import 'package:pr8_app/pages/home/bloc/home_bloc.dart' as _i335;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i229.AppDatabase>(() => _i229.AppDatabase());
    gh.lazySingleton<_i407.ArchiversRepository>(
      () => _i407.ArchiversRepository(gh<_i229.AppDatabase>()),
    );
    gh.factory<_i335.HomeBloc>(
      () => _i335.HomeBloc(gh<_i407.ArchiversRepository>()),
    );
    return this;
  }
}
