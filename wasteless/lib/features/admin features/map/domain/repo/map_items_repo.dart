import '../../../../../core/entity/bin_entity.dart';
import '../../../../../core/entity/driver_entity.dart';

abstract class MapItemsRepo {
  List<BinEntity> getAllMapBins();
  List<DriverEntity> getAllMapDrivers();
}
