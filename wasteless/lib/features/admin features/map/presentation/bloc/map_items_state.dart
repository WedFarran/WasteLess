part of 'map_items_bloc.dart';

@immutable
abstract class MapItemsState extends Equatable {
  const MapItemsState();
  @override
  List<Object> get props => [];
}

class MapItemsInitial extends MapItemsState {}

class LoadingMapItemsState extends MapItemsState {}

class LoadedMapItemsState extends MapItemsState {
  final Map<String, dynamic> mapItems;

  const LoadedMapItemsState({required this.mapItems});

  @override
  List<Object> get props => [mapItems];
}

class ErrorMapItemsState extends MapItemsState {
  final String message;

  const ErrorMapItemsState({required this.message});
  @override
  List<Object> get props => [message];
}
