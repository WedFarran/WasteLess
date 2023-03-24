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
  final Map<String, List<Either<AdminMapBin, AdminMapDriver>>> mapItems;

  const LoadedMapItemsState({required this.mapItems});

  @override
  List<Object> get props => [mapItems];
}

class ErrorMapItemsState extends MapItemssState {
  final String message;
  const ErrorMapItemsState({required this.message});

  @override
  List<Object> get props => [message];
}
