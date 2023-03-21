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

/*class MapDriversInitial extends MapItemsState {
  
}*/

class LoadingMapItemsState extends MapItemssState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

/*class LoadingMapDriversState extends MapItemsState {
  
}*/

class LoadedMapBinsState extends MapItemssState {
  final List<MapBin> mapBins;

  const LoadedMapBinsState({required this.mapBins});

  @override
  List<Object> get props => [props];
}

class LoadedMapDriversState extends MapItemssState {
  final List<MapDriver> mapDriverss;

  const LoadedMapDriversState({required this.mapDriverss});

  @override
  List<Object> get props => [props];
}

class ErrorMapBinsState extends MapItemssState {
  final String message;
  const ErrorMapBinsState({required this.message});

  @override
  List<Object> get props => [props];
}

class ErrorMapDriversState extends MapItemssState {
  final String message;
  const ErrorMapDriversState({required this.message});

  @override
  List<Object> get props => [props];
}
