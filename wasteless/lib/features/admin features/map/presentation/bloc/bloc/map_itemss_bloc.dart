// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../../../../../core/errors/failure.dart';
import '../../../../../../core/strings/errors.dart';
import '../../../domain/entities/bin_entity.dart';
import '../../../domain/entities/driver_entity.dart';
import '../../../domain/usecases/get_all_map_bins.dart';
import '../../../domain/usecases/get_all_map_drivers.dart';

part 'map_itemss_event.dart';
part 'map_itemss_state.dart';

class MapItemssBloc extends Bloc<MapItemssEvent, MapItemssState> {
  final GetAllMapBinsUsecase getAllMapBinsUsecase;
  final GetAllMapDriversUsecase getAllMapDriversUsecase;
  MapItemssBloc(
      {required this.getAllMapBinsUsecase,
      required this.getAllMapDriversUsecase})
      : super(MapItemssInitial()) {
    on<MapItemssEvent>((event, emit) async {
      if (event is GetAllMapBinsEvent || event is GetAllMapDriversEvent) {
        emit(LoadingMapItemsState());
        final failureOrMapBins = await getAllMapBinsUsecase();
        failureOrMapBins.fold((failure) {
          emit(ErrorMapBinsState(message: _mapFailureToMessage(failure)));
        }, (
          mapBins,
        ) {
          emit(LoadedMapBinsState(mapBins: mapBins));
        });

        final failureOrMapDrivers = await getAllMapDriversUsecase();
        failureOrMapDrivers.fold((failure) {
          emit(ErrorMapDriversState(message: _mapFailureToMessage(failure)));
        }, (mapDrivers) {
          emit(LoadedMapDriversState(mapDriverss: mapDrivers));
        });
      }
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE;
      case EmptyCacheFailure:
        return EMPTY_CACHE;
      case OfflineFailure:
        return OFFLINE;

      default:
        return UNEXPECTED_ERROR;
    }
  }
}
