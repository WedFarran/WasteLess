// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../../../../../core/errors/failure.dart';
import '../../../../../../core/strings/errors.dart';
import '../../../domain/entities/bin_entity.dart';
import '../../../domain/entities/driver_entity.dart';
import '../../../domain/usecases/get_all_map_bins.dart';

part 'map_itemss_event.dart';
part 'map_itemss_state.dart';

class MapItemssBloc extends Bloc<MapItemsEvent, MapItemssState> {
  final GetAllAdminMapItemsUsecase getAllMapItemsUsecase;
  //final GetAllMapDriversUsecase getAllMapDriversUsecase;
  MapItemssBloc({required this.getAllMapItemsUsecase})
      : super(MapItemssInitial()) {
    on<MapItemsEvent>((event, emit) async {
      if (event is GetAllMapItemsEvent) {
        emit(LoadingMapItemsState());
        final failureOrMapBins = await getAllMapItemsUsecase();
        failureOrMapBins.fold((failure) {
          emit(ErrorMapItemsState(message: _mapFailureToMessage(failure)));
        }, (mapItems) {
          emit(LoadedMapItemsState(mapItems: mapItems));
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
