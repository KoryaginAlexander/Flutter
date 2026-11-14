part of 'home_bloc.dart';

sealed class HomeEvent { const HomeEvent(); }
final class LoadArchivers extends HomeEvent { const LoadArchivers(); }
