// ignore_for_file: recursive_getters

part of 'map_itemss_bloc.dart';

@immutable
abstract class MapItemssState extends Equatable {
  const MapItemssState();
}

class MapItemssInitial extends MapItemssState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class LoadingMapItemsState extends MapItemssState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class LoadedMapItemsState extends MapItemssState {
  final Map<String, List<Either<AdminMapBin, AdminMapDriver>>> mapBins;

  const LoadedMapItemsState({required this.mapBins});

  @override
  List<Object> get props => [props];
}

/*class LoadedMapDriversState extends MapItemssState {
  final List<AdminMapDriver> mapDriverss;

  const LoadedMapDriversState({required this.mapDriverss});

  @override
  List<Object> get props => [props];
}*/

class ErrorMapItemsState extends MapItemssState {
  final String message;
  const ErrorMapItemsState({required this.message});

  @override
  List<Object> get props => [props];
}

/*class ErrorMapDriversState extends MapItemssState {
  final String message;
  const ErrorMapDriversState({required this.message});

  @override
  List<Object> get props => [props];
}*/
