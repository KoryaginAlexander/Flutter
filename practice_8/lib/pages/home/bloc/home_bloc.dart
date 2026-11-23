import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../data/archivers_repository.dart';
import '../../../models/archiver.dart';

part 'home_event.dart';
part 'home_state.dart';

/// HomeBloc получает репозиторий через конструктор (DI), а не создаёт его
/// самостоятельно. Аннотация @injectable регистрирует блок как factory:
/// новый экземпляр создаётся при каждом обращении к getIt<HomeBloc>().
@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ArchiversRepository repository;

  HomeBloc(this.repository) : super(const HomeInitial()) {
    on<LoadArchivers>(_onLoadArchivers);
  }

  Future<void> _onLoadArchivers(LoadArchivers event, Emitter<HomeState> emit) async {
    emit(const HomeLoading());
    try {
      final archivers = await repository.fetchArchivers();
      emit(HomeLoaded(archivers));
    } catch (_) {
      emit(const HomeError('Не удалось загрузить данные'));
    }
  }
}
