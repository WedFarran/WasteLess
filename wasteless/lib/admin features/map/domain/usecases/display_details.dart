import 'package:wasteless/admin%20features/map/domain/repos/map_repo.dart';

class DisplayDetails {
  final MapRepo mapRepo;
  DisplayDetails(this.mapRepo);

  call(String objectType, Object opject) {
    return mapRepo.displayDetails(objectType, opject);
  }
}
