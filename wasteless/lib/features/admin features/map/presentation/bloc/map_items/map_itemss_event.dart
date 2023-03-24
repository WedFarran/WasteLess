part of 'map_itemss_bloc.dart';

@immutable
abstract class MapItemsEvent extends Equatable {
  const MapItemsEvent();
}

class GetAllMapItemsEvent extends MapItemsEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

/*class GetAllMapDriversEvent extends MapItemssEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}*/
