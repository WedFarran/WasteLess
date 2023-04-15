import '../entity/bin_entity.dart';
import '../entity/driver_entity.dart';

abstract class MapItemsRepo {
  List<BinEntity> getAllMapBins();
  List<DriverEntity> getAllMapDrivers();
}
