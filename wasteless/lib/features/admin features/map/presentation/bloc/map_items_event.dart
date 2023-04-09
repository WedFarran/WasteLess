part of 'map_items_bloc.dart';

@immutable
abstract class MapItemsEvent extends Equatable {
  const MapItemsEvent();
  @override
  List<Object> get props => [];
}

class GetAllMapItemsEvent extends MapItemsEvent {}
