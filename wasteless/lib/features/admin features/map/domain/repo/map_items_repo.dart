import '../../../../../core/common/entity/bin.dart';
import '../../../../../core/common/entity/driver_entity.dart';

abstract class MapItemsRepo {
  List<BinEntity> getAllMapBins();
  List<DriverEntity> getAllMapDrivers();
}
