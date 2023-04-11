import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasteless/core/errors/failure.dart';
import '../../../../../core/strings/errors.dart';
import '../../domain/usecases/get_map_items_usecase.dart';

part 'map_items_event.dart';
part 'map_items_state.dart';

class MapItemsBloc extends Bloc<MapItemsEvent, MapItemsState> {
  final GetAllAdminMapItemsUseCase getAllAdminMapItems;

  MapItemsBloc({required this.getAllAdminMapItems}) : super(MapItemsInitial()) {
    on<MapItemsEvent>((event, emit) async {
      if (event is GetAllMapItemsEvent) {
        emit(LoadingMapItemsState());

        final failureOrmapItems = await getAllAdminMapItems();
        failureOrmapItems?.fold(
            (failure) =>
                emit(ErrorMapItemsState(message: _mapFailureToString(failure))),
            (mapItems) => emit(LoadedMapItemsState(mapItems: mapItems)));
      }
    });
  }
}

String _mapFailureToString(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE;
    case EmptyCacheFailure:
      return EMPTY_CACHE;
    case OfflineFailure:
      return NO_INTERNET_ERROR_MESSAGE;
    default:
      return UNEXPECTED_ERROR;
  }
}
