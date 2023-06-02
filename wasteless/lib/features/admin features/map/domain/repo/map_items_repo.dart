import '../../../../../core/common/domain/entity/bin.dart';
import '../../../../../core/common/domain/entity/driver_entity.dart';

abstract class MapItemsRepo {
  List<BinEntity> getAllMapBins();
  List<DriverEntity> getAllMapDrivers();
}
