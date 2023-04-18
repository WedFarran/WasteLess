import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasteless/core/errors/failure.dart';
import '../../../../../core/strings/errors.dart';

part 'map_items_event.dart';
part 'map_items_state.dart';

class MapItemsBloc extends Bloc<MapItemsEvent, MapItemsState> {
  MapItemsBloc(super.initialState);

  // ignore: unused_element
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
}
