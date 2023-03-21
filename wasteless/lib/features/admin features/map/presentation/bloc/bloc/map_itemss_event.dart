part of 'map_itemss_bloc.dart';

@immutable
abstract class MapItemssEvent extends Equatable {
  const MapItemssEvent();
}

class GetAllMapBinsEvent extends MapItemssEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetAllMapDriversEvent extends MapItemssEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
