import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/archivers_data.dart';
import '../../../models/archiver.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitial()) {
    on<LoadArchivers>(_onLoadArchivers);
  }

  Future<void> _onLoadArchivers(
    LoadArchivers event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeLoading());
    try {
      await Future<void>.delayed(const Duration(milliseconds: 500));
      emit(const HomeLoaded(archivers));
    } catch (_) {
      emit(const HomeError('Не удалось загрузить данные'));
    }
  }
}
